return {
    'williamboman/mason.nvim',
    lazy = false,
    dependencies = 'williamboman/mason-lspconfig.nvim',
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
                border = ui_border
            }
        })
    end
}
