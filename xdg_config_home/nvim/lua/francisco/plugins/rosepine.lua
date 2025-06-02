return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
        local rosepine = require('rose-pine')

        rosepine.setup({
            variant = 'main',
            styles = {
                transparency = true
            },
            highlight_groups = {
                NormalFloat = { bg = 'NONE' },
                ModeMsg = { fg = 'gold' },
                CursorLineNr = { fg = 'gold' },
                PmenuSel = { bg = 'highlight_med' },
                CmpItemKindVariable = { fg = 'pine' },
                CmpItemKindInterface = { fg = 'gold' },
                CmpItemKindClass = { fg = 'gold' },
                CmpItemKindProperty = { fg = 'foam' },
                CmpItemKindFunction = { fg = 'iris' },
                CmpItemKindMethod = { fg = 'iris' },
                CmpItemKindText = { fg = 'text' },
                CmpItemKindConstant = { fg = 'love' },
            }
        })

        -- vim.cmd.colorscheme('rose-pine')
    end
}
