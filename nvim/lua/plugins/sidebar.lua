return {
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = false})
        end
    },
    {
        "preservim/tagbar",
        config = function()
            vim.keymap.set("n", "<leader>t", ":TagbarToggle<CR>", { noremap = false})
        end
    }
}
