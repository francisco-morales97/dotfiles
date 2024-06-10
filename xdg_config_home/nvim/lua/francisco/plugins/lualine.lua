return {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local icons = require('utils').icons
        local lualine = require('lualine')
        local one_colors = require('onedark.palette').dark

        -- NOTE: Colores para onedark
        -- local colors = {
        --     bg       = one_colors.bg_d,
        --     fg       = one_colors.fg,
        --     fg_d     = one_colors.grey,
        --     yellow   = one_colors.yellow,
        --     cyan     = one_colors.cyan,
        --     darkblue = one_colors.bg_blue,
        --     green    = one_colors.green,
        --     orange   = one_colors.orange,
        --     violet   = one_colors.dark_purple,
        --     magenta  = one_colors.purple,
        --     blue     = one_colors.blue,
        --     red      = one_colors.red,
        -- }

        -- NOTE: Colores para default
        local colors = {
            bg = 'NvimDarkGray3',
            fg = 'white',
            fg_d = 'NvimLightGray4',
            yellow = 'NvimLightYellow',
            cyan = 'NvimDarkCyan',
            darkblue = 'NvimDarkBlue',
            green = 'NvimLightGreen',
            orange = 'NvimDarkYellow',
            violet = 'NvimDarkMagenta',
            magenta = 'NvimLightMagenta',
            blue = 'NvimLightBlue',
            red = 'NvimLightRed'
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                component_separators = '',
                section_separators = '',
                theme = {
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
                globalStatus = true,
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left {
            function()
                return '▊'
            end,
            -- color = { fg = colors.blue },
            color = function()
                local mode_color = {
                    n = colors.green,
                    i = colors.blue,
                    v = colors.red,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 0, right = 1 },
        }

        ins_left {
            function()
                return ''
            end,
            color = function()
                local mode_color = {
                    n = colors.green,
                    i = colors.blue,
                    v = colors.red,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { right = 1 },
        }

        ins_left {
            'branch',
            icon = '',
            color = function()
                local mode_color = {
                    n = colors.green,
                    i = colors.blue,
                    v = colors.red,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
            end,
        }

        ins_left { 'progress', color = { fg = colors.fg_d, gui = 'bold' } }

        ins_left {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = {
                error = icons.error .. ' ',
                warn = icons.warn .. ' ',
                info = icons.info .. ' ',
                hint = icons.hint .. ' '
            },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
            },
        }

        ins_left {
            function()
                return '%='
            end,
        }

        ins_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.fg, gui = 'bold' }
        }

        ins_right {
            'diff',
            symbols = { added = icons.add .. ' ', modified = icons.change .. ' ', removed = icons.delete .. ' ' },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }

        ins_right {
            'filetype',
            fmt = string.upper,
            icons_enabled = false,
            color = { fg = colors.fg_d, gui = 'bold' },
        }

        ins_right {
            function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = ' LSP:',
            color = function()
                local mode_color = {
                    n = colors.green,
                    i = colors.blue,
                    v = colors.red,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
            end,
        }

        ins_right {
            function()
                return '▊'
            end,
            -- color = { fg = colors.blue },
            color = function()
                local mode_color = {
                    n = colors.green,
                    i = colors.blue,
                    v = colors.red,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 1 },
        }

        lualine.setup(config)
    end
}
