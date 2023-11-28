return {
    'tpope/vim-fugitive',
    cond = function()
        local empty = vim.fn.empty
        local path = vim.fn.expand('%:p:h')
        local git_dir = vim.fn.finddir('.git', path .. ';')

        return empty(git_dir) ~= 1
    end,
    cmd = "G"
}
