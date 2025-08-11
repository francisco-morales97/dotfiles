local group_colors = {
    ['Normal'] = {
        bg = 'NONE'
    },
    ['NormalFloat'] = {
        bg = 'NONE'
    },
    ['FloatBorder'] = {
        fg = 'NvimDarkGray4'
    },
    ['WinSeparator'] = {
        fg = 'NvimDarkGray4'
    },
    ['ColorColumn'] = {
        bg = 'NvimDarkGray3'
    },
    ['SpellBad'] = {
        bg = 'NvimLightRed',
        fg = 'NvimDarkGray1'
    },
    ['ModeMsg'] = {
        fg = 'NvimLightYellow'
    },
    ['CursorLineNr'] = {
        fg = 'NvimLightYellow',
        bold = true,
    },
    ['PmenuSel'] = {
        bg ='NvimLightGreen',
        fg ='NvimDarkGray1'
    },
    ['StatusLine'] = {
        bg ='NONE',
        fg ='NvimLightGray1'
    },
    ['CmpItemKindVariable'] = {
        fg ='NvimLightBlue'
    },
    ['CmpItemKindInterface'] = {
        fg ='NvimLightYellow'
    },
    ['CmpItemKindClass'] = {
        fg ='NvimLightYellow'
    },
    ['CmpItemKindProperty'] = {
        fg ='NvimLightCyan'
    },
    ['CmpItemKindFunction'] = {
        fg ='NvimLightMagenta'
    },
    ['CmpItemKindMethod'] = {
        fg ='NvimLightMagenta'
    },
    ['CmpItemKindText'] = {
        fg ='NvimLightGray2'
    },
    ['CmpItemKindConstant'] = {
        fg ='NvimLightRed'
    },
    ['FzfLuaBorder'] = {
        fg = 'NvimDarkGray4'
    },
    ['@lsp.type.property'] = {
        fg = 'NvimLightGray2'
    },
    ['@lsp.type.interface'] = {
        fg = 'NvimLightGray3'
    },
    ['@lsp.type.type'] = {
        fg = 'NvimLightGray3'
    },
    ['@lsp.type.class'] = {
        fg = 'NvimLightGray4'
    },
    ['@lsp.type.parameter'] = {
        fg = 'NvimLightGray2'
    },
    ['@lsp.type.variable'] = {
        fg = 'NvimLightGray2',
        italic = true,
    },
    ['@lsp.type.keyword.cs'] = {
        link = '@keyword.import'
    },
    ['@lsp.type.controlKeyword.cs'] = {
        link = '@keyword.conditional'
    },
    ['@function.method'] = {
        fg = 'NvimLightGray1',
        bold = true,
    },
    ['@function.method.call'] = {
        fg = 'NvimLightGray2',
        bold = true,
    },
    ['@variable.builtin'] = {
        fg = 'NvimLightGray4',
        italic = true,
    },
    ['@type.builtin'] = {
        fg = 'NvimLightBlue',
    },
    ['@type.variable'] = {
        fg = 'NvimDarkGray1',
    },
    ['@keyword.import'] = {
        fg = 'NvimDarkCyan',
    },
    ['@keyword.conditional'] = {
        fg = 'NvimDarkCyan',
    },
    ['@keyword.repeat'] = {
        fg = 'NvimDarkCyan',
    },
    ['@tag'] = {
        fg = 'NvimLightGray3'
    },
    ['@tag.delimiter'] = {
        fg = 'NvimLightGray4'
    },
    ['@tag.attribute'] = {
        fg = 'NvimLightGray2',
        italic = true,
    },
    ['@variable.angular'] = {
        fg = 'NvimLightGray2',
    },
    ['@property.angular'] = {
        fg = 'NvimLightGray3',
        italic = true,
    },
}

for group, color in pairs(group_colors) do
    vim.api.nvim_set_hl(0, group, color)
end
