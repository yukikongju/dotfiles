vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("filetype plugin on")
vim.g.mapleader = ","

-- Pin Python provider so plugins like UltiSnips use a known interpreter.
--if vim.fn.executable(vim.fn.expand("~/.venvs/neovim/bin/python")) == 1 then
--vim.g.python3_host_prog = vim.fn.expand("~/.venvs/neovim/bin/python")
--elseif vim.fn.executable("/usr/local/bin/python3") == 1 then
--vim.g.python3_host_prog = "/usr/local/bin/python3"
--elseif vim.fn.executable("/opt/homebrew/bin/python3") == 1 then
--vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
--end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- require'nvim-treesitter'.install { 'rust', 'javascript', 'zig' , 'python'}

require("configs/mappings")
require("configs/options")
