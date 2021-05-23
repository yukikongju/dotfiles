" Link: https://github.com/CyberMango/init.vimango/blob/master/plugin/coc.vim
" activate :CocList extensions
" let g:coc_config_home = '$HOME/.vim/coc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc.Configs.
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" coc.nvim Configs
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Usage keymaps.
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references) inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>  " Use K to show documentation in preview window.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
    else
	call CocAction('doHover')
    endif
endfunction
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! s:check_back_space() abort
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<Tab>" :
"     \ coc#refresh()

