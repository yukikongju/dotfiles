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


" Keybindings for rustlings book
nnoremap <leader>bh :!rustlings hint next;
nnoremap <leader>bw :!rustlings watch;

nnoremap <leader>ec :!gcc %;
nnoremap <leader>ek :!g++ -O % -o %:h;
nnoremap <leader>ej :!jekyll s;
nnoremap <leader>ep :!python3 %;
nnoremap <leader>en :!python %;
nnoremap <leader>es :!Rscript %;
nnoremap <leader>er :!cargo build;
nnoremap <leader>eb :!cargo run;
nnoremap <leader>eh :!firefox %;
nnoremap <leader>el :!python3 % < inputs.txt;
nnoremap <leader>et :!./compilegcc 


" nnoremap <leader>eb :!./%:t:r;
" nnoremap <leader>er :!rustc %:p; 
" nnoremap <leader>eb :!./%:r;
" nnoremap <leader>er :!rustc %:p:t; 

let g:which_key_map.e = {
	    \'name': '+execute',
	    \'b': 'execute-rust-binary-file', 
	    \'c': 'compile-c-lang', 
	    \'j': 'serve-jekyll', 
	    \'h': 'open-html', 
	    \'p': 'execute-python3', 
	    \'s': 'execute-rscript', 
	    \'r': 'compile-rust', 
	    \}

" Keybindings for fzf
nnoremap <silent> <Leader>fa :Ag<CR> 
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fc :History:<CR>
nnoremap <silent> <leader>ff :History<CR>

if has('win32') || has('win64')
    nnoremap <silent> <leader>fe :!explorer .<CR>
elseif has('mac')
    nnoremap <silent> <leader>fe :!open .<CR>
else
    nnoremap <silent> <leader>fe :!nautilus .<CR>
endif

nnoremap <silent> <leader>fg :Commits<CR>
nnoremap <silent> <leader>fh :Helptags<CR>
nnoremap <silent> <Leader>fm :Maps<CR>
nnoremap <silent> <Leader>fr :Rg<CR>
nnoremap <silent> <Leader>fs :Snippets<CR>
nnoremap <silent> <leader>ft :Tags<CR>
nnoremap <silent> <leader>fy :registers<CR>
" nnoremap <silent> <leader>f/ :BLines<CR>
nnoremap <silent> <leader>f/ :History/<CR> 
nnoremap <silent> <leader>f' :Marks<CR>

let g:which_key_map.f = {
	    \'name': '+fzf',
	    \'a': 'Ag',
	    \'b': 'buffers',
	    \'c': 'command-history',
	    \'e': 'file-explorer',
	    \'f': 'files-history',
	    \'g': 'git-commit',
	    \'h': 'helptags',
	    \'m': 'maps',
	    \'r': 'ripgrep',
	    \'s': 'file-snippets',
	    \'t': 'tags',
	    \'y': 'yank-history',
	    \'/': 'search-history',
	    \}

" python docstring generation from vim-python-docstring
nnoremap <leader>gd :DogeGenerate<cr>
nnoremap <leader>gp :Docstring<cr>

" Generate Keybindings
let g:which_key_map.g = {
	    \'name': '+generate', 
	    \'d': 'generate-docstring with doge', 
	    \'p': 'generate-docstring-python for single function', 
	    \}


" GitGutter Keybindings
let g:which_key_map.h = {
	    \'name': '+gitgutter-hunks', 
	    \'p': 'preview-hunk', 
	    \'s': 'stage-hunk', 
	    \'u': 'undo-stage', 
	    \}


" Keybindings for latex (Fix: behavior)
nnoremap <leader>la :!git add */*.pdf */*.tex;
nnoremap <leader>lc :VimtexCompile
nnoremap <leader>lg :!pdflatex %; mv %:t:r.* %:p:h;
nnoremap <leader>ll :! pandoc % -o %<.pdf --template='%:p:h/template-letter.tex'; 
nnoremap <leader>lo :!zathura %<.pdf;
nnoremap <leader>lp :! pandoc % -o %<.pdf; 
nnoremap <leader>lr :!pdflatex %
" nnoremap <leader>ll :! pandoc % -o %<.pdf --template='template-letter.tex'; 
" nnoremap <leader>ll :! pandoc % -o %<.pdf --template='letter.tex'; 
nnoremap <leader>lb :! pandoc -t beamer % -o %<.pdf --toc --listings --number-section; 
nnoremap <leader>lt :! pandoc % -o %<.pdf --toc
nnoremap <leader>lm :! pandoc -t beamer % -o %<.pdf --slide-level=2 -V theme:metropolis ;
nnoremap <leader>ln :! pandoc -t beamer % -o %<.pdf --slide-level=2 -V theme:Montpellier -V colortheme:rose -V fonttheme:professionalfonts;
nnoremap <leader>lx :! xelatex %;

" nnoremap <leader>lt :! pandoc % -o %<.pdf --table-of-contents --number-sections -V documentclass=report -V geometry:margin=1in;
" nnoremap <leader>ln :! pandoc  --template=my-template.tex --pdf-engine=xelatex % -o %<.pdf
" nnoremap <leader>lt :! pandoc % -o %<.pdf --toc --number-sections -V documentclass=report;


" https://piware.de/2014/07/vim-config-for-markdownlatex-pandoc-editing/
" todo: save file and open
let g:which_key_map.l ={
	    \'name':'+latex',
	    \'a': 'git-add-pdf-latex',
	    \'b': 'pandoc-beamer',
	    \'c': 'compile-latex-with-evince',
	    \'g': 'generate-pdf-lecture-notes',
	    \'o': 'open-pdf-zathura',
	    \'l': 'pandoc-letter',
	    \'p': 'convert-md-to-pdf-with-pandoc',
	    \'t': 'pandoc-with-table-of-contents',
	    \'r': 'generate-pdf-from-root',
	    \'x': 'xelatex-compiling',
	    \'m': 'beamer-metropolis-theme',
	    \'n': 'beamer-montpellier-theme',
	    \}

" \'n': 'beamer-nord-theme',
" \'c': 'generate-pdf-from-current-file',

" Keybindings to open quickfix and location
nnoremap <silent> <leader>oc :!btm --color gruvbox<CR>
nnoremap <leader>ob :!newsboat;<cr>
nnoremap <silent> <leader>om :!cmatrix<CR>
nnoremap <silent> <leader>or :!ranger<CR>
let g:which_key_map.o = {
	    \ 'name' : '+open-app',
	    \ 'c' : 'open-bottom-cpu',
	    \ 'm' : 'open-cmatrix',
	    \ 'o' : 'open-newsboat',
	    \ 'r' : 'open-ranger',
	    \}

" Keybindings for global/local Replace
nnoremap <leader>ra :call GlobalSubstituteConfirm()<left>
nnoremap <leader>ru :%s/\<<C-r><C-w>\>/ 
nnoremap <leader>rc :%s/<C-r><C-w>//gc<left><left><left>
nnoremap <leader>rj :%!fmt -w 80<CR>:%!par -j -w80<CR>


" Replace Pattern TODO: write function that take old_name new_name
" :g/pattern/d - Supprime toutes les lignes correspondant à un motif donné
" :g/pattern/s//replacement/g - Remplace toutes les occurrences d'un motif donné par un remplacement donné dans toutes les lignes correspondantes
" :s/foo/bar/gc - Remplace toutes les occurrences de "foo" par "bar", en
" demandant une confirmation pour chaque occurrence (done)

let g:which_key_map.r ={
	    \'name': '+replace',
	    \'a': 'replace-all',
	    \'c': 'replace-confirm-all-under-cursor',
	    \'u': 'replace-all-under-cursor',
	    \'j': 'justify current file',
	    \}


" nnoremap <leader>sa :call AckSearch("")<left><left>
nnoremap <leader>sa :Ag <SPACE>
nnoremap <leader>sd :Gvdiffsplit<CR>
nnoremap <leader>sj :Ack <SPACE>
nnoremap <leader>su :Ack! "\b<cword>\b" <CR>	
nnoremap <leader>ss z=<CR>
" nnoremap <leader>st :call Thesaurus()<CR>   (synonym: check thesaurus.vim)

nnoremap <silent> <leader>sq  :copen<CR>
nnoremap <silent> <leader>sl  :lopen<CR>
let g:which_key_map.s ={
	    \ 'name': '+search',
	    \ 'a': 'search-word',
	    \ 'd': 'search-file-difference',
	    \ 'j': 'search-word-and-jump',
	    \ 'l': 'locationlist',
	    \ 'q': 'quickfix'    ,
	    \ 'u': 'search-under-cursor-and-jump'    ,
	    \ 's': 'spell-checking'    ,
	    \ 't': 'vim-lexical-thesaurus (only in md)'    ,
	    \}


" Keybindings for vim files
nnoremap <leader>va :source $MYVIMRC<cr>:!source $MYZSHRC<cr>:!tmux source-file $MYTMUXCONF<cr>
nnoremap <leader>ve :tabnew $MYVIMRC<cr>
nnoremap <leader>vf :tabnew ~/dotfiles/.vim/init/<cr>
nnoremap <leader>vb :tabnew ~/dotfiles/.newsboat/urls<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>
nnoremap <leader>vn :tabe<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>vt :tabnew $MYTMUXCONF<cr>
nnoremap <leader>vz :tabnew $MYZSHRC<cr>

" nnoremap <leader>vw :!source $MYZSHRC<cr>
" nnoremap <leader>vw :!tmux source-file $MYTMUXCONF<cr>

" TODO: Keybindings for .zshrc, .tmux.conf

let g:which_key_map.v ={
	    \'name':'+vim',
	    \'a': 'reload-all-rc-files',
	    \'b': 'edit-newsboat-urls',
	    \'e': 'edit-vimrc',
	    \'r': 'reload-vimrc',
	    \'f': 'open-vim-files',
	    \'s': 'open-vsplit',
	    \'t': 'edit-termux',
	    \'n': 'open-newtab',
	    \'z': 'edit-zshrc',
	    \}

" \'w': 'reload-termux',
" $ Install termux plugins: tmux run-shell ~/.tmux/plugins/tpm/bindings/install_plugins

" TODO: Keybindings for vimspector

" =======================================================
" " Create menus not based on existing mappings:
" " =======================================================

" Keybindings for windows
let g:which_key_map.w = {
	    \ 'name' : '+windows' ,
	    \ 'w' : ['<C-W>w'     , 'other-window']          ,
	    \ 'd' : ['<C-W>d'     , 'delete-window']         ,
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

" Keybindings for yank: https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
" nnoremap <leader>yp cp :let @" = expand("%")<cr>
" nnoremap <leader>yp cp :let @+ = expand("%")<cr>
nnoremap <leader>yp :!echo %<cr>


