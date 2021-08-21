
""""""""""""""""""""""
"  NERDTree Configs  "
""""""""""""""""""""""

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :NERDTreeFind<CR>

" let NERDTreeQuitOnOpen = 1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let NERDTreeAutoDeleteBuffer = 1

""""""""""""""""""""""
"  UndoTree Configs  "
""""""""""""""""""""""
nnoremap <leader>u :UndotreeShow<CR>
