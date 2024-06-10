return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
    },
    config = function()
        local map = require('utils').map
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local themes = require('telescope.themes')
        local actions = require('telescope.actions')
        local opts = { initial_mode = 'normal' }

        telescope.setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = ' ',
                entry_prefix = " ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                path_display = { 'shorten' },
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    preview_cutoff = 120,
                },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" },
            },
            pickers = {
                buffers = {
                    mappings = {
                        n = {
                            ['<C-r>'] = actions.delete_buffer
                        }
                    }
                }
            },
            extensions = {
                ["ui-select"] = {
                    themes.get_cursor {
                        codeactions = true
                    }
                },
            }
        })

        telescope.load_extension('ui-select')
        telescope.load_extension('fzf')

        -- Keymaps
        map('n', '<leader>ff', builtin.find_files, 'Busca archivos en proyecto')
        map('n', '<leader>ft', builtin.live_grep, 'Busca archivos por palabras')
        map('n', '<leader>fw', function() builtin.grep_string(opts) end, 'Busca palabra en el proyecto')
        map('n', '<leader>fb', function() builtin.buffers(opts) end, 'Muestra buffers abiertos')
        map('n', '<leader>fo', builtin.oldfiles, 'Muestra archivos recientes')
        map('n', '<leader>fg', builtin.git_files, 'Busca archivos git en proyecto')
        map('n', '<leader>gb', function() builtin.git_branches(opts) end, 'Muestra ramas de git')
        map('n', '<leader>gc', builtin.git_bcommits, 'Muestra commits de rama actual')
        map('n', '<leader>gs', function() builtin.git_stash(opts) end, 'Muestra stash de git')
        map('n', '<leader>ss', function() builtin.spell_suggest(themes.get_cursor(opts)) end, 'Muestra sugerencias ortograficas')
    end
}
