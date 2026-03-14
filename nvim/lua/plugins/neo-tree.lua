return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        branch = "v3.x",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_ignored = true, -- hide files that are ignored by other gitignore-like files
                -- other gitignore-like files, in descending order of precedence.
                ignore_files = {
                    ".neotreeignore",
                    ".ignore",
                    -- ".rgignore"
                },

            },
        },
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
}
