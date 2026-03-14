return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            on_attach = function(client)
                client.offset_encoding = "utf-16"
            end,
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                --null_ls.builtins.formatting.black,
                --null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.clang_format,
                --null_ls.builtins.diagnostics.flake8,
                --        null_ls.builtins.diagnostics.erb_lint,
                --        null_ls.builtins.diagnostics.rubocop,
                --       null_ls.builtins.formatting.rubocop,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
