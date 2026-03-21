return {
    {
        "dkarter/bullets.vim",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        init = function()
            vim.g.mkdp_browser = ''
            vim.g.mkdp_echo_preview_url = 1
        end,
    }
}
