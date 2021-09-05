" Link: https://github.com/CyberMango/init.vimango/blob/master/plugin/coc.vim
" activate :CocList extensions
" let g:coc_config_home = '$HOME/.vim/coc'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              COC.NVIM CONFIGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" COC EXTENSIONS

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
	    \ 'coc-clangd',
	    \ 'coc-cmake',
	    \ 'coc-elixir',
	    \ 'coc-java',
	    \ 'coc-jedi',
	    \ 'coc-markmap',
	    \ 'coc-snippets',
	    \ 'coc-tsserver',
	    \ 'coc-vimlsp',
	    \ 'coc-vimtex',
	    \ ]

" \ 'coc-definition',
" \ 'coc-eslint',
" \ 'coc-prettier',
" \ 'coc-python',
" \ 'coc-pyright',
" \ 'coc-todolist',
" \ 'coc-json',

" COC MAPPINGS

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Quick Fix
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> gl <Plug>(coc-codelens-action)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" coc-snippets
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'


" COC FUNCTIONS

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
	    \ pumvisible() ? "\<C-n>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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


"""""""""""""""""""""""""""""""
"  VIM-JAVACOMPLETE2 CONFIGS  "
"""""""""""""""""""""""""""""""
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" let g:JavaComplete_EnableDefaultMappings = 1


" Default Mappings
" " imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
" " imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
" " imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
" " imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

" nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
" nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
" nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
" nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

" nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

" nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
" nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
" nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
" nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
" nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
" nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
" nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

" " imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
" " imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
" " imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

" vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
" vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
" vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

" nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
" nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

