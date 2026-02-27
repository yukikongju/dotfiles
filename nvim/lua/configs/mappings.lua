local map = vim.keymap.set

-- Remap vertical move
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Remap ; to : in normal and visual mode
map('n', ';', ':')
map('v', ';', ':')

-- Remap jump to beginning/end of line
map('n', 'B', '^')
map('n', 'E', '$')
map('n', 'Y', 'y$')

-- Keeping everything centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Remove/Add Space under cursor
map('n', 'J', 'mzJ`z')
map('n', 'K', 'm`o<Esc>``')

-- Paste last thing yanked, not deleted
map('n', '<leader>p', '"0p')
map('n', '<leader>P', '"0P')

-- Move lines
map('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
map('n', '<C-j>', ':m .+1<CR>==', { silent = true })
map('n', '<C-k>', ':m .-2<CR>==', { silent = true })

-- Remap tabs
map('n', 'gt', ':tabnext<CR>')
map('n', 'gT', ':tabprevious<CR>')
map('n', '<leader>nt', ':tabe<CR>', { silent = true })

-- Formatting and stay on the same line
map('n', '<leader>i', 'gg=G``zz<CR>', { silent = true })

-- Clear highlight after search
map('n', '<esc><esc>', ':noh<CR>', { silent = true })

-- Highlight last inserted text
map('n', 'gV', '`[v`]')

-- Apply macros
map('n', 'Q', '@q')
map('v', 'Q', ':norm @q<CR>')

-- Date keybindings
-- map('', '<F1>', ':r! date "+\\%A \\%d \\%B \\%Y"<CR>')
-- map('', '<F2>', ':r! date "+\\%A \\%d \\%B \\%Y" -d "+1 day"<CR>')
-- map('n', '<leader>now', ':r!date<CR>')

-- Search exact word under cursor
-- map('v', '//', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>')

-- Execute python script
-- map('', '<F7>', '<ESC>:w<CR>:silent execute "!python %"<CR><CR>')
