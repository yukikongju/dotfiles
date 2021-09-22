
""""""""""""""""""""""
"  NERDTree Configs  "
""""""""""""""""""""""

" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <leader>n :NERDTreeFind<CR>
" nnoremap <leader>m :NERDTreeToggle<CR>

" let NERDTreeQuitOnOpen = 1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let NERDTreeAutoDeleteBuffer = 1

""""""""""""""""""""""
"  UndoTree Configs  "
""""""""""""""""""""""
nnoremap <leader>u :UndotreeShow<CR>
let g:undotree_WindowLayout=2

""""""""""""""""""""""
"  TagBar Configs  "
""""""""""""""""""""""
nnoremap <leader>t :Tagbar<CR>
let g:tagbar_autoclose=1

""""""""""""""""""""""""""""""""""""
"  Vim-Nerdtree-Syntax-Highlights  "
""""""""""""""""""""""""""""""""""""

" Disable unmatched folder and file icons having the same color as their
" labels
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" Disable Highlights
let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

" Highlights full name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1


" Highlight folders using exact match
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

