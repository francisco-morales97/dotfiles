local M = {}

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
    add = '',
    change = '',
    delete = '',
}

return M
