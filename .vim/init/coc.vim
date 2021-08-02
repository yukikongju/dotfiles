" Link: https://github.com/CyberMango/init.vimango/blob/master/plugin/coc.vim
" activate :CocList extensions
" let g:coc_config_home = '$HOME/.vim/coc'

" COC EXTENSIONS

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
	    \ 'coc-clangd',
	    \ 'coc-cmake',
	    \ 'coc-java',
	    \ 'coc-jedi',
	    \ 'coc-json',
	    \ 'coc-vimlsp',
	    \ ]

" \ 'coc-todolist',
" \ 'coc-prettier',
" \ 'coc-python',
" \ 'coc-pyright',
" \ 'coc-definition',

" COC MAPPINGS

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" COC FUNCTIONS

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" show documentation
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
	call CocActionAsync('doHover')
    else
	execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

