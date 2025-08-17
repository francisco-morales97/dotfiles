return {
    'mfussenegger/nvim-lint',
    ft = { 'javascript', 'typescript', 'vue' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            vue = { 'eslint_d' },
        }
    end
}
