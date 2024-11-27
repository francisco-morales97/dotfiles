local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.maplocalleader = ' '
g.user_emmet_leader_key = '<C-z>'
g.have_nerd_font = true

opt.compatible = false
opt.showmode = true
opt.encoding = 'utf-8'
opt.confirm = true
opt.termguicolors = true
opt.clipboard:append('unnamedplus')
opt.iskeyword:append('-')
opt.keywordprg = ':help'
opt.mouse = 'a'

opt.signcolumn = 'yes'
opt.colorcolumn = '80'
opt.cursorline = true
opt.cursorcolumn = true
opt.laststatus = 3
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.breakindent = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.splitbelow = true
opt.splitright = true

opt.wrap = true
opt.linebreak = true

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.wildmenu = true
opt.shortmess:append('c')
opt.completeopt = {
    'longest',
    'menuone',
    'noselect',
    'noinsert'
}

opt.smartindent = true
opt.autoindent = true

opt.dictionary = 'spell'
opt.spell = false
opt.spelllang = {
    'es',
    'en_us'
}

-- vim.cmd([[
--     hi ColorColumn guibg='NvimDarkGray3'
--     hi ModeMsg guifg='NvimLightYellow'
--     hi NormalFloat guibg='NONE'
--     hi FloatBorder guifg='NvimDarkGray4'
--     hi LspInfoBorder guifg='NvimDarkGray4'
--     hi WinSeparator guifg='NvimDarkGray4'
--     hi @tag.delimiter guifg='NvimLightGray4'
--     hi TelescopeBorder guifg='NvimDarkGray4'
--     hi TelescopePromptTitle guifg='NvimLightYellow'
--     hi TelescopePromptBorder guifg='NvimLightYellow'
--     hi MiniIndentscopeSymbol guifg='NvimDarkGray4'
--     hi CmpItemKindVariable guifg='NvimLightBlue'
--     hi CmpItemKindInterface guifg='NvimLightYellow'
--     hi CmpItemKindClass guifg='NvimLightYellow'
--     hi CmpItemKindProperty guifg='NvimLightCyan'
--     hi CmpItemKindFunction guifg='NvimLightMagenta'
--     hi CmpItemKindMethod guifg='NvimLightMagenta'
--     hi CmpItemKindText guifg='NvimLightGray2'
--     hi CmpItemKindConstant guifg='NvimLightRed'
--     hi PmenuSel guibg='NvimLightGreen' guifg='NvimDarkGray1'
-- ]])
