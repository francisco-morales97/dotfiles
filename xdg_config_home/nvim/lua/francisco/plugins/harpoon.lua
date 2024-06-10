return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
        local map = require('utils').map
        local border = require('utils').border
        local harpoon = require('harpoon')
        local opts = {
            border = border,
            title_pos = 'center',
            ui_width_ratio = 0.5
        }

        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true
            }
        })

        map('n', '<leader>m', function()
            harpoon:list():add()
            local current_file = vim.fn.expand('%:t')
            print('Archivo marcado:', current_file)
        end, 'Agrega archivo a harpoon')

        map('n', '<leader>fm', function()
            harpoon.ui:toggle_quick_menu(harpoon:list(), opts)
        end, 'Muestra lista de harpoon')

        map('n', '<C-h>', function()
            harpoon:list():select(1)
        end, 'Navega a archivo 1 de harpoon')

        map('n', '<C-j>', function()
            harpoon:list():select(2)
        end, 'Navega a archivo 2 de harpoon')

        map('n', '<C-k>', function()
            harpoon:list():select(3)
        end, 'Navega a archivo 3 de harpoon')

        map('n', '<C-l>', function()
            harpoon:list():select(4)
        end, 'Navega a archivo 4 de harpoon')
    end
}
