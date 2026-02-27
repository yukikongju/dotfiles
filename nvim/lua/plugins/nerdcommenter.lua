return {
    --https://github.com/preservim/nerdcommenter
    "preservim/nerdcommenter",
    lazy = false,
    config = function()
        vim.g.NERDCreateDefaultMappings = 0
        vim.keymap.set("n", "<leader>cc", "<plug>NERDCommenterToggle", { noremap = false })
    end
}
