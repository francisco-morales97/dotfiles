local M = {}

--- Funcion utilitaria para crear remaps
--- @param mode string|table
--- @param keys string
--- @param command string|function
--- @param desc string
--- @param opts table?
function M.map(mode, keys, command, desc, opts)
    desc = desc or 'No description'

    local options = {
        noremap = true,
        desc = desc,
    }

    if opts then
        options = vim.tbl_extend('force', options, opts)
    end

    vim.keymap.set(mode, keys, command, options)
end

M.border = 'rounded'

M.icons = {
    error = '',
    warn = '',
    hint = '',
    info = '',
    add = '',
    change = '',
    delete = '',
    sign_add = '│',
    sign_change = '│',
    sign_delete = '_',
    sign_topdelete = '‾',
    sign_changedelete = '~',
    sign_untracked = '┆',
}

return M
