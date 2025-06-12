local api = vim.api
local border = require('utils').border

api.nvim_create_autocmd('TextYankPost', {
    desc = 'Resaltar al copiar (yank) texto',
    group = api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

api.nvim_create_autocmd('BufWinEnter', {
    desc = 'Genera bordes redondeados para popup de ayuda',
    pattern = 'diffview:///panels/*',
    callback = function()
        if vim.api.nvim_win_get_config(0).zindex then
            vim.api.nvim_win_set_config(0, { border = border })
    end
    end
})
