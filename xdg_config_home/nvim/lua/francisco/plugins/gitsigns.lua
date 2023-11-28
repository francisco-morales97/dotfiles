return {
    'lewis6991/gitsigns.nvim',
    cond = function()
        local empty = vim.fn.empty
        local path = vim.fn.expand('%:p:h')
        local git_dir = vim.fn.finddir('.git', path .. ';')

        return empty(git_dir) ~= 1
    end,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local map = require('utils').map
        local icons = require('utils').icons
        local ui_border = require('utils').border
        local gitsigns = require('gitsigns')

        gitsigns.setup {
            signs                        = {
                add = {
                    hl = 'GitSignsAdd',
                    text = icons.add,
                    numhl = 'GitSignsAddNr',
                    linehl = 'GitSignsAddLn'
                },
                change = {
                    hl = 'GitSignsChange',
                    text = icons.change,
                    numhl = 'GitSignsChangeNr',
                    linehl = 'GitSignsChangeLn'
                },
                delete = {
                    hl = 'GitSignsDelete',
                    text = icons.delete,
                    numhl = 'GitSignsDeleteNr',
                    linehl = 'GitSignsDeleteLn'
                },
                topdelete = {
                    hl = 'GitSignsDelete',
                    text = icons.delete,
                    numhl = 'GitSignsDeleteNr',
                    linehl = 'GitSignsDeleteLn'
                },
                changedelete = {
                    hl = 'GitSignsChange',
                    text = icons.change,
                    numhl = 'GitSignsChangeNr',
                    linehl = 'GitSignsChangeLn'
                },
            },
            signcolumn                   = true,
            numhl                        = false,
            linehl                       = false,
            word_diff                    = false,
            watch_gitdir                 = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked          = true,
            current_line_blame           = false,
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,
            max_file_length              = 40000,
            preview_config               = {
                border = ui_border,
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm                         = {
                enable = false
            },
        }

        map('n', '<leader>bl', gitsigns.blame_line, 'Muestra blame line')
    end
}
