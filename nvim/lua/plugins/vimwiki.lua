return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_global_ext = 0

        vim.g.vimwiki_list = {
            { name = "Tracking",       path = "~/Projects/VimwikiNotes/Tracking",       syntax = "markdown", ext = ".md", diary_rel_path = "diary/", diary_index = "diary" }, -- Note: error in the first element in the list, which isn't recognized when doing <leader>ws
            { name = "WhatIveLearned", path = "~/Projects/VimwikiNotes/WhatIveLearned", syntax = "markdown", ext = ".md", diary_rel_path = "diary/", diary_index = "diary" },
            { name = "Journal",        path = "~/Projects/VimwikiNotes/Journal",        syntax = "markdown", ext = ".md", diary_rel_path = "diary/", diary_index = "diary" },
            { name = "Rant",           path = "~/Projects/VimwikiNotes/Rant",           syntax = "markdown", ext = ".md", diary_rel_path = "diary/", diary_index = "diary" },
        }
    end
}
