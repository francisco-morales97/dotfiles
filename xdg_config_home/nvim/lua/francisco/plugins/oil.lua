return {
    'stevearc/oil.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local map = require('utils').map
        local oil = require('oil')

        oil.setup({
            default_file_explorer = true,
            columns = {
                "icon",
                -- "permissions",
                "size",
                -- "mtime",
            },
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
            },
            delete_to_trash = false,
            skip_confirm_for_simple_edits = false,
            trash_command = "trash-put",
            prompt_save_on_select_new_entry = true,
            cleanup_delay_ms = 2000,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-v>"] = {
                    callback = function()
                        oil.select({
                            vertical = true,
                            close = true,
                        })
                    end,
                    mode = 'n',
                },
                ["<C-x>"] = {
                    callback = function()
                        oil.select({
                            horizontal = true,
                            close = true,
                        })
                    end,
                    mode = 'n',
                },
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<leader>t"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
            },
            use_default_keymaps = true,
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,
                is_always_hidden = function(name, bufnr)
                    return false
                end,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
            float = {
                padding = 2,
                max_width = 80,
                max_height = 0,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
                override = function(conf)
                    return conf
                end,
            },
            preview = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = 0.9,
                min_height = { 5, 0.1 },
                height = nil,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            progress = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = { 10, 0.9 },
                min_height = { 5, 0.1 },
                height = nil,
                border = "rounded",
                minimized_border = "none",
                win_options = {
                    winblend = 0,
                },
            },
        })

        map('n', '<leader>t', '<cmd>Oil<CR>', 'Abre explorador de archivos')
    end
}
