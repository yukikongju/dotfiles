if vim.g.neovide then
    -- Neovide-specific options (using global variables with a 'neovide_' prefix)
    --vim.g.neovide_transparency = 0.8
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_scale_factor = 1.0

    -- You can also set specific keymaps for Neovide, like using Command key on macOS
    vim.keymap.set("n", "<D-s>", ":w<CR>", { desc = "Save" })
    -- ... other platform-specific keymaps
end
