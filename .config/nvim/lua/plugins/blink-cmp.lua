return {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = { auto_show = true },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                }
            }
        },
        cmdline = {
            completion = {
                menu = { auto_show = true },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true,
                    }
                }
            }
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" }
}
