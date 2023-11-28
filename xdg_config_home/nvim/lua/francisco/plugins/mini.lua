return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        local map = require('utils').map

        require('mini.comment').setup {}

        require('mini.indentscope').setup {
            draw = {
                delay = 50,
                animation = require('mini.indentscope').gen_animation.linear({
                    easing = 'in-out',
                    duration = 3,
                    unit = 'step'
                })
            },
            options = {
                border = 'both',
                indent_at_cursor = true,
                try_as_border = false,
            },
            symbol = '╎'
        }

        require('mini.pairs').setup {
            modes = { insert = true, command = false, terminal = false },

            -- Global mappings. Each right hand side should be a pair information, a
            -- table with at least these fields (see more in |MiniPairs.map|):
            -- - <action> - one of 'open', 'close', 'closeopen'.
            -- - <pair> - two character string for pair to be used.
            -- By default pair is not inserted after `\`, quotes are not recognized by
            -- `<CR>`, `'` does not insert pair after a letter.
            -- Only parts of tables can be tweaked (others will use these defaults).
            mappings = {
                ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
                ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
                ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
                ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
                ['`'] = { action = 'open', pair = '``', neigh_pattern = '[^\\].' },

                [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
                [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
                ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
                ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
                ['`'] = { action = 'close', pair = '``', neigh_pattern = '[^\\].' },

                ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
                ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
                -- ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
                ['<'] = { action = 'closeopen', pair = '<>', neigh_pattern = '[^\\].' },
            },
        }

        require('mini.surround').setup {
            highlight_duration = 500,
            mappings = {
                add = 'sa',
                delete = 'sd',
                find = '',
                find_left = '',
                highlight = '',
                replace = 'sr',
            },
        }

        require('mini.bufremove').setup { set_vim_settings = true }
        require('mini.move').setup {}

        local gen_hook = require('mini.splitjoin').gen_hook
        local curly = { brackets = { '%b{}' } }
        local pad_curly = gen_hook.pad_brackets(curly)

        require('mini.splitjoin').setup {
            mappings = { toggle = 'gS' },
            join = {
                hooks_post = { pad_curly }
            }
        }

        -- require('mini.tabline').setup{}

        map('n', '<leader>bd', MiniBufremove.delete, 'Borra buffer actual')
        map('n', '<leader>bu', MiniBufremove.unshow, 'Oculta buffer actual')

        local group = vim.api.nvim_create_augroup('MiniFileTypeDisabling', { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { 'oil', 'lazy', 'mason', 'help' },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
            group = group,
        })
    end
}
