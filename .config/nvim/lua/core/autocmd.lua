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

api.nvim_create_autocmd('LspAttach', {
    desc = 'Keymaps al iniciarse los LSP',
    callback = function(event)
        local map = require('utils').map
        local opts = {buffer = event.buf}

        map('n', 'gd', vim.lsp.buf.definition, 'Ir a definicion', opts)
        map('n', 'K', vim.lsp.buf.hover, 'Muestra info en hover', opts)
        map('n', 'gl', vim.diagnostic.open_float, 'Abre diagnostico en ventana flotante', opts)
        map('n', '<leader>rn', vim.lsp.buf.rename, 'Renombra variable', opts)
        map('n', '<leader>rs', '<cmd>LspRestart<CR>', 'Reinicia LSP', opts)
    end,
})

local group = vim.api.nvim_create_augroup('MiniFileTypeDisabling', { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = { 'oil', 'lazy', 'mason', 'help' },
    group = group,
    callback = function()
        vim.b.miniindentscope_disable = true
    end
})
