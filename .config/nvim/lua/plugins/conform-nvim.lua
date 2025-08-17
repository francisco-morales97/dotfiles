return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            vue = { 'eslint_d' },
            css = { 'prettier' },
            scss = { 'prettier' },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 500,
        }
    },
}
