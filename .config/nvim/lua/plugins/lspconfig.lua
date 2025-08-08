return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local map = require('utils').map
        local icons = require('utils').icons
        local ui_border = require('utils').border
        local mason_lsp = require('mason-lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local lspconfig = require('lspconfig')

        require('lspconfig.ui.windows').default_options.border = ui_border

        vim.diagnostic.config({
            virtual_text = {
                prefix = '●'
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = icons.error,
                    [vim.diagnostic.severity.WARN] = icons.warn,
                    [vim.diagnostic.severity.HINT] = icons.hint,
                    [vim.diagnostic.severity.INFO] = icons.info,
                }
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
                map('n', '<leader>rn', vim.lsp.buf.rename, 'Renombra variable', opts)
                map('n', '<leader>rs', '<cmd>LspRestart<CR>', 'Reinicia LSP', opts)
            end,
        })

        require('lspconfig.ui.windows').default_options.border = ui_border

        -- NOTE: Estas variables son para el servidor de angular
        local currentDir = vim.fn.getcwd() .. '/node_modules'
        local angularPath = vim.fn.expand('$MASON/packages/angular-language-server/node_modules/@angular/language-server/node_modules')
        local default_node_modules = angularPath .. ',' .. currentDir
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
            vue_ls = {},
            marksman = {},
            angularls = {
                cmd = ngls_cmd,
                on_new_config = function(new_config, new_root_dir)
                    new_config.cmd = ngls_cmd
                end
            },
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true)
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                }
            },
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
