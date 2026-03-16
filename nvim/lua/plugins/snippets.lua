return {
    --{ "SirVer/ultisnips" },
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    --{
    --"hrsh7th/cmp-buffer"
    --},
    --{
    --"hrsh7th/cmp-path"
    --},
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local types = require("cmp.types")
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_lua").load({
                paths = "~/.config/nvim/snippets/"
            })

            --require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

            cmp.setup({
                --completion = { autocomplete = false },
                preselect = cmp.PreselectMode.Item,
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        local luasnip = require("luasnip")
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        local luasnip = require("luasnip")
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    --["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    --["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    --["<C-f>"] = cmp.mapping.scroll_docs(4),
                    --["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.exact,
                        cmp.config.compare.score,

                        -- De-prioritize snippet items unless prefix strongly matches
                        function(entry1, entry2)
                            local k1 = entry1:get_kind()
                            local k2 = entry2:get_kind()
                            local s1 = k1 == types.lsp.CompletionItemKind.Snippet
                            local s2 = k2 == types.lsp.CompletionItemKind.Snippet
                            if s1 ~= s2 then
                                return not s1 -- non-snippets first
                            end
                        end,

                        -- prefer recently used and locality
                        cmp.config.compare.recently_used,
                        cmp.config.compare.locality,

                        -- stable fall back
                        --cmp.config.compare.offset,
                        --cmp.config.compare.kind,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp", group_index = 1, priority = 700, max_item_count = 10 },
                    { name = "luasnip",  group_index = 1, priority = 1000 },
                    --{ name = "ultisnips", group_index = 1, priority = 1000 },
                    --{ name = "path",     group_index = 2, priority = 400 },
                    --{ name = "buffer",   group_index = 2, priority = 300 },
                }),
            })
        end,
    },
}
