return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        local map = require('utils').map

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

        local gen_hook = require('mini.splitjoin').gen_hook
        local curly = { brackets = { '%b{}' } }
        local pad_curly = gen_hook.pad_brackets(curly)

        require('mini.splitjoin').setup {
            mappings = { toggle = 'gS' },
            join = {
                hooks_post = { pad_curly }
            }
        }

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
