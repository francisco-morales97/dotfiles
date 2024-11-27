return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {
            'hrsh7th/cmp-cmdline',
            event = 'CmdlineEnter',
        },
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
        },
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local snippet = luasnip.snippet
        local text_node = luasnip.text_node
        local insert_node = luasnip.insert_node
        local map = require('utils').map

        local kind_icons = {
            Text = '',
            Method = '',
            Function = '',
            Constructor = '',
            Field = '',
            Variable = '',
            Class = '',
            Interface = '',
            Module = '',
            Property = '',
            Unit = '',
            Value = '',
            Enum = '',
            Keyword = '',
            Snippet = '',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = '',
            Event = '',
            Operator = '',
            TypeParameter = '',
        }

        map({ 'i', 's' }, '<A-k>', function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, 'Retrocede al anterior placeholder del snippet')

        map({ 'i', 's' }, '<A-j>', function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end, 'Avanza al siguiente placeholder del snippet')

        luasnip.add_snippets('htmlangular', {
            snippet('inter', {
                text_node('{{ '),
                insert_node(1),
                text_node(' }}')
            });
        })

        luasnip.add_snippets('htmlangular', {
            snippet('for', {
                text_node('@for ('), insert_node(1), text_node(') {'),
                text_node({ '', '\t' }), insert_node(2),
                text_node({ '', '} @empty {' }),
                text_node({ '', '\t' }), insert_node(0),
                text_node({ '', '}' }),
            })
        })

        luasnip.add_snippets('htmlangular', {
            snippet('if', {
                text_node('@if ('), insert_node(1), text_node(') {'),
                text_node({ '', '\t' }), insert_node(2),
                text_node({ '', '}' }),
            })
        })

        luasnip.add_snippets('nroff', {
            snippet('h1', {
                text_node('.HEADING 1 "'), insert_node(1), text_node('"')
            })
        })

        luasnip.add_snippets('nroff', {
            snippet('h2', {
                text_node('.HEADING 2 "'), insert_node(1), text_node('"')
            })
        })

        luasnip.add_snippets('nroff', {
            snippet('h3', {
                text_node('.HEADING 3 "'), insert_node(1), text_node('"')
            })
        })

        luasnip.add_snippets('nroff', {
            snippet('list', {
                text_node({ '.LIST', '\n' }),
                text_node('.SHIFT_LIST '), insert_node(1),
                text_node({ '.ITEM', '\n' }),
                insert_node(2),
                text_node('.LIST OFF')
            })
        })

        luasnip.add_snippets('nroff', {
            snippet('bold', {
                text_node('\f[B] '), insert_node(1), text_node('\f[R]'),
            })
        })

        luasnip.add_snippets('nroff', {
            snippet('ital', {
                text_node('\f[I] '), insert_node(1), text_node('\f[R]'),
            })
        })

        luasnip.add_snippets('nroff', {
            snippet('table', {
                text_node('.TS'),
                insert_node(1),
                text_node('.TE'),
            })
        })

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            completion = {
                completeopt = 'longest,menuone,noselect,noinsert',
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-p>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        cmp.complete()
                    end
                end),
                ['<C-n>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        cmp.complete()
                    end
                end),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip', keyword_length = 2 },
                { name = 'buffer',  keyword_length = 3 },
                { name = 'path' },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            formatting = {
                format = function(entry, vim_item)
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                    })[entry.source.name]
                    return vim_item
                end
            },
        })

        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'cmp_git' },
            }, {
                    { name = 'buffer' },
                })
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            },
                {
                    { name = 'cmdline' }
                })
        })
    end
}
