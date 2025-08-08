return {
    'alexghergh/nvim-tmux-navigation',
    config = function()
        local map = require('utils').map
        local tmux_nav = require('nvim-tmux-navigation')

        tmux_nav.setup {
            disable_when_zoomed = true
        }

        map('n', '<C-w>h', '<cmd>NvimTmuxNavigateLeft<CR>', 'Mueve hacia split izquierdo')
        map('n', '<C-w>j', '<cmd>NvimTmuxNavigateDown<CR>', 'Mueve hacia split inferior')
        map('n', '<C-w>k', '<cmd>NvimTmuxNavigateUp<CR>', 'Mueve hacia split superior')
        map('n', '<C-w>l', '<cmd>NvimTmuxNavigateRight<CR>', 'Mueve hacia split derecho')
    end
}
