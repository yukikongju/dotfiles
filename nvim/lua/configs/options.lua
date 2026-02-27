local opt = vim.opt

-- 
vim.cmd("set nocompatible")
vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")


-- Indentation and tabulation
opt.formatoptions = "tcqrn1"
opt.shiftwidth = 4
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
opt.shiftround = false
opt.softtabstop = 4

-- Swapfiles
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.autowrite = true

-- File Stats
opt.ruler = true
opt.confirm = true

-- Security
opt.modelines = 0

-- Status bar
opt.laststatus = 2
opt.showmode = true
opt.showcmd = true
opt.wildmenu = true
opt.startofline = false
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.title = true

-- Rendering
opt.ttyfast = true

-- Encoding
opt.encoding = "UTF-8"

-- Buffers
opt.hidden = true

-- Line numbers
opt.number = true
vim.opt.relativenumber = true

-- Searching
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- Colorscheme
vim.cmd("syntax enable")
opt.termguicolors = true
opt.background = "dark"
-- vim.cmd("colorscheme gruvbox")


-- Clipboard
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.opt.clipboard = "unnamed"
elseif vim.fn.has("mac") == 1 then
  vim.opt.clipboard = "unnamed,unnamedplus"
else
  vim.opt.clipboard = "unnamedplus"
end
--
--
