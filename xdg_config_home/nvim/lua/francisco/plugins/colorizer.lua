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
        },
        user_default_options = {
            RGB = true, -- #RGB hex codes
            RRGGBB = true, -- #RRGGBB hex codes
            names = false, -- "Name" codes like Blue or blue
            RRGGBBAA = false, -- #RRGGBBAA hex codes
            AARRGGBB = false, -- 0xAARRGGBB hex codes
            rgb_fn = true, -- CSS rgb() and rgba() functions
            hsl_fn = true, -- CSS hsl() and hsla() functions
            -- Available modes for `mode`: foreground, background,  virtualtext
            mode = "background", -- Set the display mode.
            -- Available methods are false / true / "normal" / "lsp" / "both"
            -- True is same as normal
            tailwind = false, -- Enable tailwind colors
            virtualtext = "■",
            -- update color values even if buffer is not focused
            -- example use: cmp_menu, cmp_docs
            always_update = false
        },
        -- css = {
        --     rgb_fn = true,
        --     hsl_fn = true,
        --     names = false,
        --     virtualtext = '■'
        -- },
        -- scss = {
        --     rgb_fn = true,
        --     hsl_fn = true,
        --     names = false,
        --     virtualtext = '■'
        -- },
        -- html = { names = false };
        -- javascript = { names = false };
        -- typescript = { names = false };
        -- vue = { names = false };
    }
}
