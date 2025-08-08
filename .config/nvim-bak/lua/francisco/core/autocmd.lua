local api = vim.api
local opt = vim.opt
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
        if api.nvim_win_get_config(0).zindex then
            api.nvim_win_set_config(0, { border = border })
        end
    end
})

api.nvim_create_autocmd("BufWinEnter", {
    desc = 'Reajusta el tamaño de los archivos css al abrirse como split vertical',
    pattern = {'*.scss', '*.css'},
    callback = function()
        if vim.fn.winnr('$') > 1 then
            vim.cmd('vertical resize 86')
        end
    end
})

api.nvim_create_autocmd('WinEnter', {
    desc = 'Activa el color column y cursor column para ventana activa',
    callback = function()
        opt.colorcolumn = '80'
        opt.cursorline = true
        opt.cursorcolumn = true
    end
})

api.nvim_create_autocmd('WinLeave', {
    desc = 'Desactiva el color column y cursor column para ventana activa',
    callback = function()
        opt.colorcolumn = '0'
        opt.cursorline = false
        opt.cursorcolumn = false
    end
})
