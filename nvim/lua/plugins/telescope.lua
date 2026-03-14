return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        --branch = "0.2.x",
        --branch = "0.1.x",
        --tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
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


            local actions = require("telescope.actions")
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    preview = {
                        treesitter = false, -- keep false to fix telescope and treesitter mismatch. Only telescope preview window stops using Treesitter highlighting
                    },

                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },


                },
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown({}),
                    fzf = {},
                },
                --pickers = {
                --find_files = { theme = "ivy" }
                --}
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>fm", builtin.keymaps, {})

            -- quickfix utils: ]q, [q
            vim.keymap.set("n", "<leader>fc", builtin.command_history, {})
            vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})
            --vim.keymap.set("n", "<leader>fh", builtin.quickfixhistory, {})
            vim.keymap.set("n", "<leader>fl", builtin.loclist, {})

            -- grep word under cursor in all files recursively -- useful for quickfix
            vim.keymap.set('n', '<leader>vg', ':vim <cword> **<CR>', { silent = true })


            --
            --TODO: find packages: see CJ vid
            --vim.keymap.set("n", "<space>en", function()
            --require('telescope.builtin').find_files {
            --cwd = vim.fn.stdpath("config")
            --}
            --end)
            --vim.keymap.set("n", "<space>ep", function()
            --require('telescope.builtin').find_files {
            --cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
            --}
            --end)


            pcall(telescope.load_extension, "ui-select")
        end,
    },
}
