return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        { 'folke/neodev.nvim', config = true },
    },
    config = function()
        local map = require('utils').map
        local icons = require('utils').icons
        local ui_border = require('utils').border
        local mason_lsp = require('mason-lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local lspconfig = require('lspconfig')
        -- local telescope_builtin = require('telescope.builtin')

        require('lspconfig.ui.windows').default_options.border = ui_border

        vim.diagnostic.config({
            virtual_text = {
                prefix = '●'
            }
        })

        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or ui_border
            opts.max_width = opts.max_width or 80
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            cmp_nvim_lsp.default_capabilities()
        )

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = {buffer = event.buf}

                map('n', 'gd', vim.lsp.buf.definition, 'Ir a definicion', opts)
                map('n', 'K', vim.lsp.buf.hover, 'Muestra info en hover', opts)
                map('n', 'gl', vim.diagnostic.open_float, 'Abre diagnostico en ventana flotante', opts)
                -- map('n', '<leader>ca', vim.lsp.buf.code_action, 'Muestra acciones de codigo disponibles', opts)
                -- map('n', 'gr', function() telescope_builtin.lsp_references({ initial_mode = 'normal' }) end,
                --     'Muestra lista de referencias', opts)
                map('n', '<leader>rn', vim.lsp.buf.rename, 'Renombra variable', opts)
                map('n', '<leader>rs', '<cmd>LspRestart<CR>', 'Reinicia LSP', opts)
            end,
        })

        local signs = {
            Error = icons.error,
            Warn = icons.warn,
            Hint = icons.hint,
            Info = icons.info
        }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        require('lspconfig.ui.windows').default_options.border = ui_border

        -- NOTE: Estas variables son para el servidor de angular
        local currentDir = vim.fn.getcwd() .. "/node_modules"
        local default_node_modules = "/home/francisco/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/node_modules," .. currentDir
        local ngls_cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations",
            default_node_modules,
            "--ngProbeLocations",
            default_node_modules
        }

        local servers = {
            html = {},
            cssls = {},
            css_variables = {},
            emmet_ls = {},
            ts_ls = {},
            volar = {},
            lua_ls = {},
            marksman = {},
            angularls = {
                cmd = ngls_cmd,
                on_new_config = function(new_config, new_root_dir)
                    new_config.cmd = ngls_cmd
                end
            }
        }

        local ensure_installed = vim.tbl_keys(servers or {})

        mason_lsp.setup({
            ensure_installed = ensure_installed,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    lspconfig[server_name].setup(server)
                end
            }
        })
    end
}
