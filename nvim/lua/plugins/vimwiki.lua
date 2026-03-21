return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_global_ext = 0

        vim.g.vimwiki_list = {
            { name = "WhatIveLearned", path = "~/Projects/VimwikiNotes/WhatIveLearned", syntax = "markdown", ext = ".md" },
        }
    end
}
