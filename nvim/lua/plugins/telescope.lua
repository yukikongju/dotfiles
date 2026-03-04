return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.2.x",
        --branch = "0.1.x",
        --tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            -- FIXME: temporary fix due to telescope and treesitter mismatch
            local ok_ts, ts_parsers = pcall(require, "nvim-treesitter.parsers")
            if ok_ts and type(ts_parsers) == "table" and ts_parsers.ft_to_lang == nil then
                ts_parsers.ft_to_lang = function(ft)
                    local ok_lang, lang = pcall(vim.treesitter.language.get_lang, ft)
                    if ok_lang and type(lang) == "string" and lang ~= "" then
                        return lang
                    end
                    return ft
                end
            end

            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    preview = {
                        treesitter = false, -- keep false to fix telescope and treesitter mismatch
                    },
                },
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown({}),
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

            pcall(telescope.load_extension, "ui-select")
        end,
    },
}
