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
            require("luasnip.loaders.from_vscode").lazy_load()
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
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    --["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    --["<C-f>"] = cmp.mapping.scroll_docs(4),
                    --["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.score,
                        cmp.config.compare.exact,
                        cmp.config.compare.offset,
                        cmp.config.compare.kind,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp", max_item_count = 10 },
                    --{ name = "nvim_lsp" },
                    { name = "luasnip" },
                    --{ name = "path" },
                    --{ name = "buffer" },
                    --{name = "ultisnips"},
                }),
            })
        end,
    },
}
