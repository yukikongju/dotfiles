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

" Keybindings for SpellCheck/autocorrect/wordcount
nnoremap <leader>ao :setlocal spell!<CR>
nnoremap <leader>at :call ToggleSpellLang()<CR>

let g:which_key_map.a = {
	    \ 'name': '+autocorrect',
	    \ 'o': 'autocorrect-on-off',
	    \ 't' : 'toggle-lang',
	    \}

nmap <leader>hd <Plug>(GitGutterPreviewHunk)
nmap <leader>hf <Plug>(GitGutterFold)
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hp <Plug>(GitGutterPrevHunk)

" Keybindings for gitgutter hunks
let g:which_key_map.h = {
	    \'name':'+hunk',
	    \'d': 'hunks-difference',
	    \'f': 'fold-hunks',
	    \'n': 'next-hunk',
	    \'p': 'previous-hunk',
	    \}

"     \'p': ['<Plug>(GitGutterPreviewHunk)' , 'preview-hunk'],
"     \'s': ['<Plug>(GitGutterStageHunk)' , 'stage-hunk'],
"     \'u': ['<Plug>(GitGutterUndoHunk)' , 'undo-hunk'],

" Keybindings for fzf
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>f/ :BLines<CR>
nnoremap <silent> <leader>f' :Marks<CR>
nnoremap <silent> <leader>ff :History<CR>
nnoremap <silent> <leader>fg :Commits<CR>
nnoremap <silent> <leader>ft :Tags<CR>
nnoremap <silent> <Leader>fs :Snippets<CR>
nnoremap <silent> <Leader>fm :Maps<CR>
nnoremap <silent> <leader>fe :!nautilus .<CR>
nnoremap <silent> <Leader>fa :Ag<CR> 
nnoremap <silent> <Leader>fr :Rg<CR>
nnoremap <silent> <leader>fc :History:<CR>
" nnoremap <silent> <leader>fs: :History/<CR> " search history
" nnoremap <silent> <leader>H :Helptags<CR>

let g:which_key_map.f = {
	    \'name': '+fzf',
	    \'b': 'buffers',
	    \'c': 'command-history',
	    \'f': 'files-history',
	    \'g': 'git-commit',
	    \'m': 'maps',
	    \'e': 'file-explorer',
	    \'r': 'ripgrep',
	    \'s': 'snippets',
	    \'t': 'tags',
	    \'/': 'blines',
	    \}

" Keybindings for latex (Fix: behavior)
nnoremap <leader>la :!git add */*.pdf */*.tex;
nnoremap <leader>lg :!pdflatex %; mv %:t:r.* %:p:h;
nnoremap <leader>lr :!pdflatex %
nnoremap <leader>lc :VimtexCompile
nnoremap <leader>lo :!zathura %<.pdf;
nnoremap <leader>lp :! pandoc % -o %<.pdf; 
" nnoremap <leader>ll :! pandoc --template=template-letter.md % -o %<.pdf; 
nnoremap <leader>ll :! pandoc --template=template-letter.tex % -o %<.pdf; 
" nnoremap <leader>lt :! pandoc % -o %<.pdf --table-of-contents --number-sections -V documentclass=report -V geometry:margin=1in;
" nnoremap <leader>lt :! pandoc % -o %<.pdf --toc --number-sections -V documentclass=report;
nnoremap <leader>lt :! pandoc % -o %<.pdf --toc
nnoremap <leader>lb :! pandoc -t beamer % -o %<.pdf --toc --listings --number-section; 
" nnoremap <leader>ln :! pandoc % -o %<.pdf --from markdown --template template-beamer.tex --listings --number-sections --pdf-engine=xelatex;
" nnoremap <leader>ln :! pandoc % -o %<.pdf --template=my-template.tex --pdf-engine=xelatex
nnoremap <leader>ln :! pandoc  --template=my-template.tex --pdf-engine=xelatex % -o %<.pdf
nnoremap <leader>lx :! xelatex %;
" https://piware.de/2014/07/vim-config-for-markdownlatex-pandoc-editing/
" todo: save file and open
let g:which_key_map.l ={
	    \'name':'+latex',
	    \'a': 'git-add-pdf-latex',
	    \'b': 'pandoc-beamer',
	    \'c': 'compile-latex-with-evince',
	    \'g': 'generate-pdf-lecture-notes',
	    \'o': 'open-pdf-zathura',
	    \'l': 'template-letter',
	    \'p': 'convert-md-to-pdf-with-pandoc',
	    \'t': 'pandoc-with-table-of-contents',
	    \'r': 'generate-pdf-from-root',
	    \'x': 'xelatex-compiling',
	    \'n': 'beamer-nord-theme',
	    \}

nnoremap <leader>ep :!python3 %;
nnoremap <leader>er :!Rscript %;
nnoremap <leader>ej :!jekyll s;

let g:which_key_map.e = {
	    \'name': '+execute',
	    \'p': 'execute-python3', 
	    \'r': 'execute-rscript', 
	    \'j': 'serve-jekyll', 
	    \}


" \'c': 'generate-pdf-from-current-file',

" Keybindings to open quickfix and location
nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
	    \ 'name' : '+open',
	    \ 'q' : 'open-quickfix'    ,
	    \ 'l' : 'open-locationlist',
	    \}

" Keybindings for global/local Replace
nnoremap <leader>ra :%s/\<<C-r><C-w>\>/
nnoremap <leader>rc gD:%s/<C-R>///gc<left><left><left><C-R>
let g:which_key_map.r ={
	    \'name': 'replace',
	    \'a': 'replace-all',
	    \'c': 'replace-confirm',
	    \}

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

" TODO: Keybindings for vimspector

" =======================================================
" " Create menus not based on existing mappings:
" " =======================================================

" Keybindings for windows
let g:which_key_map.w = {
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

