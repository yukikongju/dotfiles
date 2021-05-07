" Remap vertical move
  nnoremap j gj
  nnoremap k gk

" Remap jump to beginning/end of line
  nnoremap B ^
  nnoremap E $

" Remap Save Session
  nnoremap <leader>s :mksession<CR>			" we can save session with mks!

" remap change windows split quickly
  nmap <leader>h :wincmd h<CR>
  nmap <leader>j :wincmd j<CR>
  nmap <leader>k :wincmd k<CR>
  nmap <leader>l :wincmd l<CR>
  nnoremap <silent> <leader>+ :vertical resize +5<CR>
  nnoremap <silent> <leader>- :vertical resize +5<CR>

" remap tabs change
  nmap gt :tabnext<CR>
  nmap gT :tabprevious<CR>
  nmap <leader>nt :tabe<CR>				" create new tab

" edit and reload vimrc shortcut
  nnoremap <leader>ev :tabnew $MYVIMRC<cr>       " edit vimrc
  nnoremap <leader>rv :source $MYVIMRC<cr>       " reload vimrv

" Keybinding for date
  map <F2> :r! date +"\%A \%d \%B \%Y" <CR>

" remap for file indentation
  map <leader>r gg=G<CR>			" indent whole file with gg=G

" remap apply macros
  nnoremap Q @q
  vnoremap Q :norm @q<cr>

" mapping to move lines
  nnoremap <C-j> :m .+1<CR>==
  nnoremap <C-k> :m .-2<CR>==

"  global remap
  nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
  " nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>    " local replace
  " nnoremap gR gD:%s/<C-R>///gc<left><left><left>        " For global replace

