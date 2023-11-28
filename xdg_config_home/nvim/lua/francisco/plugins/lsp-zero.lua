return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },

    -- LSP Installer
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            local ui_border = require('utils').border
            local mason = require('mason')

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                    border = ui_border,
                }
            })
        end,
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {
                'hrsh7th/cmp-cmdline',
                event = 'CmdlineEnter',
            },
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()
            local luasnip = require('luasnip')
            local kind_icons = {
                Text = '',
                Method = '',
                Function = '',
                Constructor = '',
                Field = '',
                Variable = '',
                Class = '',
                Interface = '',
                Module = '',
                Property = '',
                Unit = '',
                Value = '',
                Enum = '',
                Keyword = '',
                Snippet = '',
                Color = '',
                File = '',
                Reference = '',
                Folder = '',
                EnumMember = '',
                Constant = '',
                Struct = '',
                Event = '',
                Operator = '',
                TypeParameter = '',
            }

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                completion = {
                    completeopt = 'longest,menuone,noselect,noinsert',
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer',  keyword_length = 3 },
                    { name = 'path' },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                        })[entry.source.name]
                        return vim_item
                    end
                },
            })

            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'cmp_git' },
                }, {
                    { name = 'buffer' },
                })
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                        { name = 'path' }
                    },
                    {
                        { name = 'cmdline' }
                    })
            })
        end
    },

    -- LSP Configuration
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim',
            { 'folke/neodev.nvim', config = true },
        },
        config = function()
            local map = require('utils').map
            local icons = require('utils').icons
            local ui_border = require('utils').border
            local lsp_zero = require('lsp-zero')
            local mason_lsp = require('mason-lspconfig')
            local telescope_builtin = require('telescope.builtin')

            require('lspconfig.ui.windows').default_options.border = ui_border

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or ui_border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- lsp_zero.default_keymaps({buffer = bufnr})
                local opts = {
                    buffer = bufnr,
                    noremap = true,
                }

                map('n', 'gd', vim.lsp.buf.definition, 'Ir a definicion', opts)
                map('n', 'K', vim.lsp.buf.hover, 'Muestra info en hover', opts)
                map('n', 'gl', vim.diagnostic.open_float, 'Abre diagnostico en ventana flotante', opts)
                map('n', '<leader>ca', vim.lsp.buf.code_action, 'Muestra acciones de codigo disponibles', opts)
                map('n', 'gr', function() telescope_builtin.lsp_references({ initial_mode = 'normal' }) end,
                    'Muestra lista de referencias', opts)
                map('n', '<leader>rn', vim.lsp.buf.rename, 'Renombra variable', opts)
                map('n', '<leader>rs', '<cmd>LspRestart<CR>', 'Reinicia LSP', opts)
            end)

            lsp_zero.set_sign_icons({
                error = icons.error,
                warn = icons.warn,
                hint = icons.hint,
                info = icons.info
            })

            mason_lsp.setup({
                ensure_installed = {
                    'html',
                    'cssls',
                    'emmet_ls',
                    'tsserver',
                    'angularls',
                    'volar',
                    'lua_ls',
                },
                handlers = {
                    lsp_zero.default_setup,
                }
            })
        end
    }
}
