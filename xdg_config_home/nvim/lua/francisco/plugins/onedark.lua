return {
    'navarasu/onedark.nvim',
    config = function()
        local onedark = require('onedark')
        local colors = require('onedark.palette').dark

        onedark.setup({
            style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = true,
            term_colors = true,
            ending_tildes = false,
            cmp_itemkind_reverse = false,
            toggle_style_key = nil,
            toggle_style_list = {
                'dark',
                'darker',
                'cool',
                'deep',
                'warm',
                'warmer',
                'light'
            },
            code_style = {
                comments = 'italic',
                keywords = 'italic',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            },
            colors = {}, -- Override default colors
            highlights = {
                CursorLineNr = { fg = colors.yellow },
                TelescopePromptBorder = { fg = colors.yellow },
                TelescopePromptTitle = { fg = colors.yellow, },
                TelescopePreviewTitle = { fg = colors.fg, },
                TelescopePreviewBorder = { fg = colors.grey, },
                TelescopeResultsTitle = { fg = colors.fg, },
                TelescopeResultsBorder = { fg = colors.grey, },
                NormalFloat = { bg = 'NONE' },
                FloatBorder = { fg = colors.grey, bg = 'NONE' },
                LspInfoBorder = { fg = colors.grey },
                NvimTreeNormal = { bg = '#21252b' },
                ['@tag'] = { fg = colors.red },
                ['@tag.delimiter'] = { fg = colors.grey },
            }, -- Override highlight groups
            diagnostics = {
                darker = false, -- darker colors for diagnostic
                undercurl = true,
                background = true,    -- use background color for virtual text
            },
        })

        onedark.load()
    end
}
