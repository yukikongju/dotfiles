"""""""""""""""""""""
"  vimwiki Configs  "
"""""""""""""""""""""
let g:vimwiki_folding='expr' "list, '', expr, syntax,

" Subfolders: Courses, Logs, Rant, FlashCards, ActiveRecall, Prog
let g:vimwiki_list = [
	    \{
	    \ 'path': '~/VimWikiNotes/Courses/',
	    \ 'name':'Courses',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/VimWikiNotes/Courses/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \},
	    \{
	    \ 'path': '~/VimWikiNotes/Logs/',
	    \ 'name': 'Logs',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/VimWikiNotes/Logs/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \},
	    \{
	    \ 'path': '~/VimWikiNotes/Rant/',
	    \ 'name': 'Rant',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/VimWikiNotes/Rant/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \},
	    \{
	    \ 'path': '~/VimWikiNotes/FlashCards/',
	    \ 'name':'Flash Cards',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/VimWikiNotes/FlashCards/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \},
	    \{
	    \ 'path': '~/VimWikiNotes/ActiveRecall/',
	    \ 'name':'Active Recall',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/VimWikiNotes/ActiveRecall/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \}
	    \]
" Automatically export vimwiki to html
" \ 'auto_export':1,

" Mapping to generate html for all vimwiki files
nnoremap <leader>wa :VimwikiAll2HTML<CR>

" Set Title as File Name
" au BufNewFile *.md :r!echo %:t:r;

" Macro to create new vimwiki + title with @t
" let @q = 'BwYv$<Enter>PBx='
" let @q = 'BwYv$'

" use <tab> to jump to next sections and snippets in insert mode
let g:vimwiki_table_mappings = 0

""""""""""""""""""""""""""
"  vim.calendar Configs  "
""""""""""""""""""""""""""

let g:calendar_task_delete = 1

