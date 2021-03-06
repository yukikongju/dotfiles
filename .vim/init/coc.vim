" activate :CocList extensions
" let g:coc_config_home = '$HOME/.vim/coc'

" coc.nvim Configs
  let g:coc_disable_startup_warning = 1
  let g:coc_global_extensions = [
		\ 'coc-clangd',
		\ 'coc-cmake',
		\ 'coc-java',
		\ 'coc-jedi',
		\ 'coc-prettier',
		\ 'coc-pyright',
		\ 'coc-python',
		\ 'coc-vimlsp',
		\ ]

		" \ 'coc-todolist',
		" \ 'coc-definition',

  nmap <silent> gd <Plug>(coc-definition)        " GoTo code navigation.
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references) inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  nnoremap <silent> K :call <SID>show_documentation()<CR>  " Use K to show documentation in preview window.

  " use <tab> for trigger completion and navigate to the next complete item
  function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
