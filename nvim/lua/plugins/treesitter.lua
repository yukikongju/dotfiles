return {
    {
    -- FIXME: https://github.com/cpow/neovim-for-newbs/blob/main/lua/plugins/treesitter.lua 
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local ok, ts = pcall(require, "nvim-treesitter")
            if not ok then
                return
            end

            pcall(ts.install, { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "bash", "python", "javascript", "rust", "zig" })

            local group = vim.api.nvim_create_augroup("nvim_treesitter_setup", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
