" UltiSnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="$HOME/.vim/UltiSnips"
" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
" let g:UltiSnipsSnippetDirectories = [$HOME.'/vim/UltiSnips']

 " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" when alone, allow coc-snip expand
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" tab completion
let g:ultisnipsexpandtrigger = "<tab>"
let g:ultisnipsjumpforwardtrigger = "<c-n>"
let g:ultisnipsjumpbackwardtrigger = "<c-p>"

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)

" Use tex.snippets for .tex and .plaintex files
" autocmd BuffEnter,BufNew *.plaintex setf plaintex.tex

" VSCode like tab completion
inoremap <silent><expr> <TAB>
	    \ pumvisible() ? coc#_select_confirm() :
	    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" snippets
" let g:snipMate = { 'snippet_version' : 1 }

" let g:UltiSnipsUsePythonVersion = 3
