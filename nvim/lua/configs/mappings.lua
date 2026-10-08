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

-- Add lines below/above
map('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

-- Move lines
map('n', '<C-j>', ':m .+1<CR>==', { silent = true })
map('n', '<C-k>', ':m .-2<CR>==', { silent = true })

-- Remap tabs
map('n', 'gt', ':tabnext<CR>')
map('n', 'gT', ':tabprevious<CR>')
map('n', '<leader>nt', ':tabe<CR>', { silent = true })
map('n', '<leader>nv', ':vsplit<CR>', { silent = true })
map('n', '<leader>nh', ':split<CR>', { silent = true })

-- Formatting and stay on the same line
map('n', '<leader>i', 'gg=G``zz<CR>', { silent = true })

-- Clear highlight after search
map('n', '<esc><esc>', ':noh<CR>', { silent = true })

-- Highlight last inserted text
map('n', 'gV', '`[v`]')

-- Apply macros
map('n', 'Q', '@q')
map('v', 'Q', ':norm @q<CR>')

-- Dotfiles mappings
-- map('n', '<leader>ve', ':tabnew $MYVIMRC<cr>')
map('n', '<leader>vf', ':tabnew ~/dotfiles/nvim/init.lua<cr>')
map('n', '<leader>vf', ':tabnew ~/dotfiles/nvim/lua/<cr>')
map('n', '<leader>vb', ':tabnew ~/dotfiles/.newsboat/urls<cr>')
map('n', '<leader>vr', ':source ~/.config/init.lua<cr>')
map('n', '<leader>vn', ':tabe<cr>')
map('n', '<leader>vs', ':vsplit<cr>')
map('n', '<leader>vt', ':tabnew $MYTMUXCONF<cr>')
map('n', '<leader>vz', ':tabnew $MYZSHRC<cr>')

-- Copying files path
map('n', '<leader>pa', function() vim.fn.setreg('+', vim.fn.expand('%:p')) end)   -- absolute path
map('n', '<leader>pr', function() vim.fn.setreg('+', vim.fn.expand('%:~:.')) end) -- relative path


-- fzf
map('n', '<leader>fb', ':Buffers<CR>', { silent = true, desc = "Find Open Buffers" })
map('n', '<leader>fc', ':History:<CR>', { silent = true, desc = "Command History" })
map('n', '<leader>ff', ':History<CR>', { silent = true, desc = "File History" })
-- map('n', '<leader>fg', ':Commits<CR>', { silent = true, desc = "Git Commits" })
map('n', '<leader>fh', ':Helptags<CR>', { silent = true, desc = "Help Tags" })
map('n', '<leader>fm', ':Maps<CR>', { silent = true, desc = "Keymaps" })
-- map('n', '<leader>fr', ':Rg<CR>', { silent = true, desc = "Ripgrep (Search text)" })
-- map('n', '<leader>fs', ':Snippets<CR>', { silent = true, desc = "Snippets" })
map('n', '<leader>ft', ':Tags<CR>', { silent = true, desc = "Tags" })
-- map('n', '<leader>fy', ':registers<CR>', { silent = true, desc = "Registers" })
map('n', '<leader>f/', ':History/<CR>', { silent = true, desc = "Search History" })
map('n', "<leader>f'", ':Marks<CR>', { silent = true, desc = "Marks" })

-- Global/Local Replace Keybindings
-- :g/pattern/d - Supprime toutes les lignes correspondant à un motif donné
-- :g/pattern/s//replacement/g - Remplace toutes les occurrences d'un motif donné par un remplacement donné dans toutes les lignes correspondantes
-- :s/foo/bar/gc - Remplace toutes les occurrences de "foo" par "bar", en demandant une confirmation pour chaque occurrence (done)
map('n', '<leader>ra', ':%s/<C-r><C-w>//g<left><left><left>', { desc = "replace-all" })
map('n', '<leader>ru', [[:%s/\<<C-r><C-w>\>/ ]], { desc = "replace-all-under-cursor" })
map('n', '<leader>rc', ':%s/<C-r><C-w>//gc<left><left><left>', { desc = "replace-confirm-all-under-cursor" })
map('n', '<leader>rj', ':%!fmt -w 80<CR>:%!par -j -w80<CR>', { silent = true, desc = "justify current file" })

-- Placeholder for your 'a' mapping (which was in your which-key map but missing from nnoremap)
-- map('n', '<leader>ra', ':g/pattern/s//replacement/g', { desc = "replace-all" })

-- Date keybindings
-- map('', '<F1>', ':r! date "+\\%A \\%d \\%B \\%Y"<CR>')
-- map('', '<F2>', ':r! date "+\\%A \\%d \\%B \\%Y" -d "+1 day"<CR>')
-- map('n', '<leader>now', ':r!date<CR>')

-- Search exact word under cursor
-- map('v', '//', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>')

-- Execute python script
-- map('', '<F7>', '<ESC>:w<CR>:silent execute "!python %"<CR><CR>')
