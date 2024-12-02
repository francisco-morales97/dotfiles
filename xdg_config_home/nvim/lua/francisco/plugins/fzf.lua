return {
    "ibhagwan/fzf-lua",
    config = function()
        local map = require('utils').map
        local fzf = require("fzf-lua")
        local actions = require('fzf-lua.actions')

        fzf.setup({
            defaults = {
                git_icons = false,
                file_icons = false,
                color_icons = false
            },
            winopts = {
                backdrop = 100,
                preview = {
                    scrollbar = 'float',
                    vertical = 'up:75%',
                    layout = 'flex',
                    flip_columns = 200,
                }
            },
            fzf_opts = {
                ["--layout"] = "reverse"
            },
            grep = {
                no_header = true,
                no_header_i = true
            },
            keymap = {
                fzf = {
                    ["ctrl-q"] = 'select-all+accept'
                }
            }
        })

        -- Keymaps
        map('n', '<leader>ff', fzf.files, 'Busca archivos en proyecto')
        map('n', '<leader>ft', fzf.live_grep, 'Busca archivos por palabras')
        map('n', '<leader>fw', fzf.grep_cword, 'Busca palabra en el proyecto')
        map('n', '<leader>fb', fzf.buffers, 'Muestra buffers abiertos')
        map('n', '<leader>fo', fzf.oldfiles, 'Muestra archivos recientes')
        map('n', '<leader>fg', fzf.git_files, 'Busca archivos git en proyecto')
        map('n', '<leader>gb', fzf.git_branches, 'Muestra ramas de git')
        map('n', '<leader>gc', fzf.git_bcommits, 'Muestra commits de rama actual')
        map('n', '<leader>gs', fzf.git_stash, 'Muestra stash de git')
        map('n', 'gr', fzf.lsp_references, 'Muestra lista de referencias')
        map('n', '<leader>ca', fzf.lsp_code_actions, 'Muestra acciones de codigo disponibles')
        map('n', '<leader>ss', function()
            fzf.spell_suggest({
                winopts = {
                    relative = 'cursor',
                    row = 1.01,
                    col = 0,
                    height = 0.2,
                    width = 0.3
                }
            })
        end, 'Muestra sugerencias ortograficas')
    end
}
