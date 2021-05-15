" Remap vertical move
  nnoremap j gj
  nnoremap k gk

" Remap jump to beginning/end of line
  map B ^
  map E $

" Remap Save Session
  nnoremap <leader>s :mksession!<CR>	" we can save session with mks!

" remap change windows split quickly
  nmap <leader>h :wincmd h<CR>
  nmap <leader>j :wincmd j<CR>
  nmap <leader>k :wincmd k<CR>
  nmap <leader>l :wincmd l<CR>
  nnoremap <Leader>+ :vertical resize +5<CR>
  nnoremap <Leader>- :vertical resize +5<CR>

" remap tabs change
  nmap gt :tabnext<CR>
  nmap gT :tabprevious<CR>
  nmap <leader>nt :tabe<CR>

" edit and reload vimrc shortcut
  nnoremap <leader>ev :tabnew $MYVIMRC<cr>       " edit vimrc
  nnoremap <leader>rv :source $MYVIMRC<cr>       " reload vimrv
  nnoremap <leader>vf :tabnew ~/dotfiles/.vim/init/ " open .vim files dir

" latex compile shortcut into current directory on Windows
  nnoremap <leader>ll :!pdflatex %; mv %:t:r.* %:p:h;
  nnoremap <leader>la :!cd %:h; explorer %:t:r.pdf

" Add all latex and pdf files inside repository
  nnoremap <leader>lc :!git add */*.pdf */*.tex;
" Autocommit latex and pdf files inside repository

" Keybinding for date
  map <F2> :r! date +"\%A \%d \%B \%Y" <CR>

" remap for file indentation
  map <leader>r gg=G<CR>

" remap apply macros
  nnoremap Q @q
  vnoremap Q :norm @q<cr>

" mapping to move lines
  nnoremap J :m .+1<CR>gv=gv
  nnoremap K :m .-2<CR>gv=gv

" quickfix remaps to find errors
  " map <C-j> :cn<CR>
  " map <C-k> :cp<CR>

" Workaround to fix letters insertion after using escape keys by remaping
" escape + arrow to its respective motion
  nnoremap <silent> <ESC>OA <UP>
  nnoremap <silent> <ESC>OB <DOWN>
  nnoremap <silent> <ESC>OC <RIGHT>
  nnoremap <silent> <ESC>OD <LEFT>
  inoremap <silent> <ESC>OA <UP>
  inoremap <silent> <ESC>OB <DOWN>
  inoremap <silent> <ESC>OC <RIGHT>
  inoremap <silent> <ESC>OD <LEFT>

" replace under cursor, global replace
  nnoremap <Leader>a :%s/\<<C-r><C-w>\>/
  nnoremap gR gD:%s/<C-R>///gc<left><left><left><C-R>

