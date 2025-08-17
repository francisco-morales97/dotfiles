return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'saghen/blink.cmp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local ui_border = require('utils').border
        local mason_lsp = require('mason-lspconfig')
        local servers = {
            'html',
            'cssls',
            'css_variables',
            'emmet_ls',
            'ts_ls',
            'vue_ls',
            'marksman',
            'angularls',
            'lua_ls'
        }

        vim.lsp.enable(servers)
        vim.lsp.config.lua_ls = {
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                    telemetry = { enable = false }
                }
            }
        }

        local currentDir = vim.fn.getcwd() .. '/node_modules'
        local angularPath = vim.fn.expand(
            '$MASON/packages/angular-language-server/node_modules/@angular/language-server/node_modules')
        local default_node_modules = angularPath .. ',' .. currentDir
        local ngls_cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations",
            default_node_modules,
            "--ngProbeLocations",
            default_node_modules
        }
        vim.lsp.config.angularls = {
            cmd = ngls_cmd,
            on_new_config = function(new_config, new_root_dir)
                new_config.cmd = ngls_cmd
            end
        }

        require('lspconfig.ui.windows').default_options.border = ui_border

        vim.diagnostic.config({
            virtual_text = {
                prefix = '●'
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = 'E',
                    [vim.diagnostic.severity.WARN] = 'W',
                    [vim.diagnostic.severity.HINT] = 'H',
                    [vim.diagnostic.severity.INFO] = 'I',
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

        mason_lsp.setup({ ensure_installed = servers, })
    end
}
