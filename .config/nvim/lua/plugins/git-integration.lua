return {
    {
        'tpope/vim-fugitive',
        cond = function()
            local empty = vim.fn.empty
            local path = vim.fn.expand('%:p:h')
            local git_dir = vim.fn.finddir('.git', path .. ';')

            return empty(git_dir) ~= 1
        end,
        cmd = "G"
    },
    {
        'sindrets/diffview.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            hooks = {
                view_opened = function()
                    require('diffview.actions').toggle_files()
                end
            }
        }
    },
    {
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
                signs = {
                    add = { text = icons.sign_add },
                    change = { text = icons.sign_change },
                    delete = { text = icons.sign_delete },
                    topdelete = { text = icons.sign_topdelete },
                    changedelete = { text = icons.sign_changedelete },
                    untracked = { text = icons.sign_untracked },
                },
                signcolumn = true,
                numhl = false,
                linehl = false,
                word_diff = false,
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true
                },
                attach_to_untracked = true,
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol',
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,
                max_file_length = 40000,
                preview_config = {
                    border = ui_border,
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                yadm = {
                    enable = false
                },
            }

            map('n', '<leader>bl', gitsigns.blame_line, 'Muestra blame line')
        end
    }
}
