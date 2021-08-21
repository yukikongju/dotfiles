" Choose vim-which-keys leader
let g:mapleader = ","
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Define prefix dictionary
let g:which_key_map =  {}

" =======================================================
" Create menus based on existing mappings
" =======================================================

" Keybindings for vim files
nnoremap <silent> <leader>ve :tabnew $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>
nnoremap <silent> <leader>vf :tabnew ~/dotfiles/.vim/init/<cr>
let g:which_key_map.v ={
	    \'name':'+vim',
	    \'e':'edit-vim',
	    \'r':'reload-vim',
	    \'f':'open-vim-subdirectory'
	    \}

" Keybindings to open quickfix and location
nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
	    \ 'name' : '+open',
	    \ 'q' : 'open-quickfix'    ,
	    \ 'l' : 'open-locationlist',
	    \}

" Keybindings for latex (Fix: behavior)
nnoremap <leader>lg :!pdflatex %; mv %:t:r.* %:p:h;
nnoremap <leader>lr :!pdflatex %
" nnoremap <leader>lc :!cd %:p:h; pdflatex %
nnoremap <leader>lo :!cd %:h; explorer %:t:r.pdf
nnoremap <leader>la :!git add */*.pdf */*.tex;
let g:which_key_map.l ={
	    \'name':'+latex',
	    \'a': 'git-add-pdf-latex',
	    \'g': 'generate-pdf-lecture-notes',
	    \'r': 'generate-pdf-from-root',
	    \'o': 'open-pdf-windows',
	    \}

" \'c': 'generate-pdf-from-current-file',

" =======================================================
" " Create menus not based on existing mappings:
" " =======================================================

" Keybindings for windows
let g:which_key_map['w'] = {
	    \ 'name' : '+windows' ,
	    \ 'w' : ['<C-W>w'     , 'other-window']          ,
	    \ 'd' : ['<C-W>c'     , 'delete-window']         ,
	    \ '-' : ['<C-W>s'     , 'split-window-below']    ,
	    \ '|' : ['<C-W>v'     , 'split-window-right']    ,
	    \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
	    \ 'h' : ['<C-W>h'     , 'window-left']           ,
	    \ 'j' : ['<C-W>j'     , 'window-below']          ,
	    \ 'l' : ['<C-W>l'     , 'window-right']          ,
	    \ 'k' : ['<C-W>k'     , 'window-up']             ,
	    \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
	    \ 'J' : [':resize +5'  , 'expand-window-below']   ,
	    \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
	    \ 'K' : [':resize -5'  , 'expand-window-up']      ,
	    \ '=' : ['<C-W>='     , 'balance-window']        ,
	    \ 's' : ['<C-W>s'     , 'split-window-below']    ,
	    \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
	    \ '?' : ['Windows'    , 'fzf-window']            ,
	    \}

" Keybindings for buffer
let g:which_key_map.b = {
	    \ 'name' : '+buffer' ,
	    \ '1' : ['b1'        , 'buffer 1']        ,
	    \ '2' : ['b2'        , 'buffer 2']        ,
	    \ 'd' : ['bd'        , 'delete-buffer']   ,
	    \ 'f' : ['bfirst'    , 'first-buffer']    ,
	    \ 'h' : ['Startify'  , 'home-buffer']     ,
	    \ 'l' : ['blast'     , 'last-buffer']     ,
	    \ 'n' : ['bnext'     , 'next-buffer']     ,
	    \ 'p' : ['bprevious' , 'previous-buffer'] ,
	    \ '?' : ['Buffers'   , 'fzf-buffer']      ,
	    \}
