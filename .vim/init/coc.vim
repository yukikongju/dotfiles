" Link: https://github.com/CyberMango/init.vimango/blob/master/plugin/coc.vim
" activate :CocList extensions
" let g:coc_config_home = '$HOME/.vim/coc'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              COC.NVIM CONFIGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" COC EXTENSIONS:

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
	    \ 'coc-clangd',
	    \ 'coc-cmake',
	    \ 'coc-jedi',
	    \ ]

" \ 'coc-markmap',
" \ 'coc-elixir',
" \ 'coc-snippets',
" \ 'coc-tsserver',
" \ 'coc-vimtex',
" \ 'coc-rls',
" \ 'coc-rust-analyzer',
" \ 'coc-java',
" \ 'coc-vimlsp',
" \ 'coc-r-lsp',
" \ 'coc-definition',
" \ 'coc-eslint',
" \ 'coc-prettier',
" \ 'coc-python',
" \ 'coc-pyright',
" \ 'coc-todolist',
" \ 'coc-json',

" COC MAPPINGS:

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

" Quick Fix:
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> gl <Plug>(coc-codelens-action)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" coc-snippets
let g:coc_snippet_next_key = '<Tab>'
" let g:coc_snippet_next = '<TAB>'
" let g:coc_snippet_prev = '<S-TAB>'


" COC FUNCTIONS:

" Use tab for trigger completion with characters ahead and navigate: (python
" function autocomplete)
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" Don't put that!!!
" inoremap <silent><expr> <Tab>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" VSCode like tab completion: using tab to trigger snippet
inoremap <silent><expr> <TAB>
	    \ pumvisible() ? coc#_select_confirm() :
	    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	    \ <SID>CheckBackspace() ? "\<TAB>" :
	    \ coc#refresh()


" let g:coc_snippet_next = '<tab>'

" use <c-space> for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use <c-space> to trigger completion.
" if has('nvim')
"     inoremap <silent><expr> <c-space> coc#refresh()
" else
"     inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position
" if exists('*complete_info')
"     inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"     inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Python Docstring Generators                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configs for 'pixelneo/vim-python-docstring'
let g:python_style = 'numpy'


" Configs for 'kkoomen/vim-doge'
let g:doge_doc_standard_python = 'numpy'
let g:doge_doc_standard_cpp    = 'doxygen_javadoc'
let g:doge_doc_standard_c      = 'doxygen_javadoc'

" remap <leader>d for Doge completion mapping
let g:doge_mapping = '<leader>gd'

