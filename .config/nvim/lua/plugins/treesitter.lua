return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'angular',
                'css',
                'html',
                'javascript',
                'json',
                'lua',
                'markdown',
                'regex',
                'scss',
                'typescript',
                'vim',
                'vue',
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end
}
