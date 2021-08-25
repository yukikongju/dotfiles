"""""""""""""""""""""
"  vimwiki Configs  "
"""""""""""""""""""""
let g:vimwiki_folding='expr' "list, '', expr, syntax,

let g:vimwiki_list = [{
    \ 'path': '~/vimwiki',
    \ 'template_path': '~/vimwiki/templates/',
    \ 'template_default': 'default',
    \ 'syntax': 'markdown',
    \ 'ext': '.md',
    \ 'path_html': '~/vimwiki/site_html/',
    \ 'custom_wiki2html': 'vimwiki_markdown',
    \ 'template_ext': '.tpl' }]

nnoremap <leader>wa :VimwikiAll2HTML<CR>

" use <tab> to jump to next sections and snippets in insert mode
let g:vimwiki_table_mappings = 0

" unmap <tab> to allow .md completion
" au filetype vimwiki silent! iunmap <buffer> <Tab>
" au filetype vimwiki silent! iunmap <buffer> <Tab>

""""""""""""""""""""""""""
"  vim.calendar Configs  "
""""""""""""""""""""""""""

let g:calendar_task_delete = 1

