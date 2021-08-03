" Remap vertical move
nnoremap j gj
nnoremap k gk

" Remap ; to : in normal and vertical mode
nnoremap ; :
vnoremap ; :

" Remap jump to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap Y y$

" Keeping everything centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Remap Save Session
nnoremap <leader>s :mksession!<CR>

" Paste last thing yanked, not deleted
nmap <leader>p "0p
nmap <leader>P "0P

" mapping to move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" adding/removing blank line above/below
nnoremap <F3> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <F4> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <F5> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <F6> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" remap change windows split quickly (<c-w>hjkl)
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize +5<CR>
" nmap <leader>h :wincmd h<CR>
" nmap <leader>j :wincmd j<CR>
" nmap <leader>k :wincmd k<CR>
" nmap <leader>l :wincmd l<CR>

" remap tabs change
nmap gt :tabnext<CR>
nmap gT :tabprevious<CR>
nmap <leader>nt :tabe<CR>

" Quick fix Remaps
" nnoremap <leader>qe :cw<CR> "open quickfix window if there are errors (error)
" nnoremap <leader>qj :cn<CR> " go to next error in the window
" nnoremap <leader>qk :cp<CR> " go to previous error in the window
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Formatting
map <leader>r gg=G<CR> " format the entire file

" write only if something is changed
" noremap <leader>w :up<cr>

" Clear highlight after search
nnoremap <esc><esc> :let @/=''<cr>
" nnoremap <esc><esc> :noh<return>

" Highlist last inserted text
nnoremap gV `[v`]

" remap apply macros
nnoremap Q @q
vnoremap Q :norm @q<cr>

" edit and reload vimrc shortcut
nnoremap <leader>ev :tabnew $MYVIMRC<cr>       " edit vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>       " reload vimrv
nnoremap <leader>vf :tabnew ~/dotfiles/.vim/init/<cr> " open .vim files dir
" nnoremap <leader>ez :tabnew ~/.zshrc<CR> " edit zshrc

" latex compile shortcut into current directory on Windows
nnoremap <leader>ll :!pdflatex %; mv %:t:r.* %:p:h;
nnoremap <leader>la :!cd %:h; explorer %:t:r.pdf

" Add all latex and pdf files inside repository
nnoremap <leader>lc :!git add */*.pdf */*.tex;

" Autocommit latex and pdf files inside repository

" Keybinding for date
map <F1> :r! date "+\%A \%d \%B \%Y" <CR>
map <F2> :r! date "+\%A \%d \%B \%Y" -d "+1 day" <CR>


" replace under cursor, global replace
nnoremap <Leader>a :%s/\<<C-r><C-w>\>/
nnoremap gR gD:%s/<C-R>///gc<left><left><left><C-R>

" Search exact word


" quickfix remaps to find errors
" map <C-j> :cn<CR>
" map <C-k> :cp<CR>

" Execute python script from vim
noremap <F7> <ESC>:w<CR>:silent execute "!python %"<CR><CR>

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


