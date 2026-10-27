---- HIGHLIGHTS ----

-- 1. Define keyword group with regex: ex: 'OrangeKeywordGroup'
vim.cmd([[syntax match OrangeKeywordGroup /\v<(EXPLORE|PROGRESS)>/]])
-- 2. Define the colors for custom group
local function set_hl()
    vim.api.nvim_set_hl(0, "OrangeKeywordGroup", {
        fg = "#000000",
        bg = "#fcbe03",
        bold = true,
    })
end

-- 3. colorschemes (catpuccin) clear custom groups, so re-apply on every ColorScheme event
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })
set_hl()
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = function()
        if not vim.w.custom_kw then
            vim.w.custom_kw = vim.fn.matchadd("OrangeKeywordGroup", [[\v<(EXPLORE|PROGRESS)>]])
        end
    end,
})
