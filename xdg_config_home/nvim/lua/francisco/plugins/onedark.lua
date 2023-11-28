return {
    'navarasu/onedark.nvim',
    config = function()
        local onedark = require('onedark')

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
                CursorLineNr = { fg = '$yellow' },
                TelescopePromptBorder = { fg = '$yellow' },
                TelescopePromptTitle = { fg = '$yellow', },
                TelescopePreviewTitle = { fg = '$fg', },
                TelescopePreviewBorder = { fg = '$fg', },
                TelescopeResultsTitle = { fg = '$fg', },
                TelescopeResultsBorder = { fg = '$fg', },
                NormalFloat = { bg = 'NONE' },
                FloatBorder = { fg = '$fg', bg = 'NONE' },
                LspInfoBorder = { fg = '$fg' },
                NvimTreeNormal = { bg = '#21252b' },
                ['@tag'] = { fg = '$red' },
                ['@tag.delimiter'] = { fg = '$light_grey' },
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
