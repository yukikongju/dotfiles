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

" Remove/Add Space under cursor
nnoremap J mzJ`z
nnoremap K m`o<Esc>``

" Remap Save Session
" nnoremap <leader>s :mksession!<CR>

" Paste last thing yanked, not deleted
nmap <leader>p "0p
nmap <leader>P "0P

" Move lines
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
" make alt work: the terminal map alt to escape key by default
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" nnoremap <silent> <M-j> :m .+1<CR>==
" nnoremap <silent> <M-k> :m .-2<CR>==

" remap tabs change
nmap gt :tabnext<CR>
nmap gT :tabprevious<CR>
nmap <silent> <leader>nt :tabe<CR>

" Quick fix Remaps
" nnoremap <leader>qe :cw<CR> "open quickfix window if there are errors (error)
" nnoremap <leader>qj :cn<CR> " go to next error in the window
" nnoremap <leader>qk :cp<CR> " go to previous error in the window
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Formatting and stay on the same line
nmap <silent> <leader>i gg=G``zz<CR>

" Formatting on save

" write only if something is changed
" noremap <leader>w :up<cr>

" Clear highlight after search
nnoremap <silent> <esc><esc> :noh<return>

" Highlist last inserted text
nnoremap gV `[v`]

" remap apply macros
nnoremap Q @q
vnoremap Q :norm @q<cr>


" Keybinding for date
map <F1> :r! date "+\%A \%d \%B \%Y" <CR>
map <F2> :r! date "+\%A \%d \%B \%Y" -d "+1 day" <CR>

" Global/Local Replace
nnoremap <leader>ra :%s/\<<C-r><C-w>\>/
nnoremap <leader>rc gD:%s/<C-R>///gc<left><left><left><C-R>

" Search exact word


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


