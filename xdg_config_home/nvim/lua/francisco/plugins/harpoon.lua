return {
    'ThePrimeagen/harpoon',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
        local map = require('utils').map
        local harpoon = require('harpoon')
        local hm = require('harpoon.mark');
        local hu = require('harpoon.ui');

        harpoon.setup {
            save_on_toggle = false,
            save_on_change = true,
            enter_on_sendcmd = false,
            excluded_filetypes = { "harpoon" },

            -- set marks specific to each git branch inside git repository
            mark_branch = false,

            -- enable tabline with harpoon marks
            tabline = false,
            tabline_prefix = "   ",
            tabline_suffix = "   ",

            menu = {
                width = 80,
            }
        }

        map('n', '<leader>m', function()
            hm.add_file();
            local current_file = vim.fn.expand('%:t')
            print('Archivo marcado:', current_file)
        end, 'Agrega archivo a harpoon')

        map('n', '<leader>fm', hu.toggle_quick_menu, 'Muestra lista de harpoon')

        map('n', '<C-h>', function()
            hu.nav_file(1)
        end, 'Navega a archivo 1 de harpoon')

        map('n', '<C-j>', function()
            hu.nav_file(2)
        end, 'Navega a archivo 2 de harpoon')

        map('n', '<C-k>', function()
            hu.nav_file(3)
        end, 'Navega a archivo 3 de harpoon')

        map('n', '<C-l>', function()
            hu.nav_file(4)
        end, 'Navega a archivo 4 de harpoon')
    end
}
