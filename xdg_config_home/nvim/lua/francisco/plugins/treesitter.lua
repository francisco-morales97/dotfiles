return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'css',
                'scss',
                'html',
                'json',
                'javascript',
                'lua',
                'regex',
                'typescript',
                'vim',
                'vue'
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            }
        })
    end
}
