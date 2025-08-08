return {
    'mfussenegger/nvim-lint',
    cond = function()
        local empty = vim.fn.empty
        local path = vim.fn.expand('%:p:h')
        local eslint_conf = vim.fn.findfile('.eslintrc.json', path .. ';')

        return empty(eslint_conf) ~= 1
    end,
    ft = { 'javascript', 'typescript', 'vue' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            vue = { 'eslint_d' },
        }

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end
}
