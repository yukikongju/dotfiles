return {
    {
        "tpope/vim-fugitive"
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()

            vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
            vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
            vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", {})
            vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", {})
            vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", {})
            vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", {})
        end
    }
}
