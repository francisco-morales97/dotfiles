return {
    'NvChad/nvim-colorizer.lua',
    ft = {
        'css',
        'scss',
        'javascript',
        'typescript',
        'vue',
    },
    opts = {
        filetypes = {
            'css',
            'scss',
            'javascript',
            'typescript',
            'vue'
        };
        css = {
            rgb_fn = true,
            hsl_fn = true,
            names = false,
            virtualtext = '■'
        };
        scss = {
            rgb_fn = true,
            hsl_fn = true,
            names = false,
            virtualtext = '■'
        };
        html = { names = false };
        javascript = { names = false };
        typescript = { names = false };
        vue = { names = false };
    }
}
