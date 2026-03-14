return {
    --https://github.com/preservim/nerdcommenter
    "preservim/nerdcommenter",
    lazy = false,
    init = function()
        vim.g.NERDCreateDefaultMappings = 0 -- note: need to define default NERDCreateDefaultMappings in init instead of in config to avoid overriding LSP control action
        vim.g.NERDSpaceDelims = 1           -- space between comments
    end,
    config = function()
        vim.keymap.set("n", "<leader>ci", "<plug>NERDCommenterToggle", { noremap = false }) -- add commenter in normal mode
        vim.keymap.set("x", "<leader>ci", "<plug>NERDCommenterToggle", { noremap = false }) -- add commenter in visual mode

        vim.keymap.set("n", "<leader>cc", "<plug>NERDCommenterToggle", { noremap = false }) -- add commenter in normal mode
        vim.keymap.set("x", "<leader>cc", "<plug>NERDCommenterToggle", { noremap = false }) -- add commenter in visual mode
    end
}
