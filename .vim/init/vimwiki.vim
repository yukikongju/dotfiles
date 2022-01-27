"""""""""""""""""""""
"  vimwiki Configs  "
"""""""""""""""""""""
" https://vimwiki.github.io/vimwikiwiki/Tips%20and%20Snips.html


let g:vimwiki_folding='expr' "list, '', expr, syntax,


" TODO: change vimwiki base path based on os
if has('win32')
    let _vimwiki_base_path = "C:\Users\emuli\OneDrive - Universite de Montreal\VimWikiNotes"
elseif has("linux")
    let _vimwiki_base_path = "~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes"
endif

" Subfolders: Courses, Logs, Rant, FlashCards, ActiveRecall, Prog
let g:vimwiki_list = [
	    \{
	    \ 'path': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/WhatIveLearned/',
	    \ 'name':'What I have learned',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/WhatIveLearned/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \},
	    \{
	    \ 'path': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Courses/',
	    \ 'name':'Courses',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Courses/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \},
	    \{
	    \ 'path': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Logs/',
	    \ 'name': 'Logs',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Logs/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \ 'auto_diary-index': 1,
	    \},
	    \{
	    \ 'path': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Rant/',
	    \ 'name': 'Rant',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Rant/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \ 'auto_generate_tags': 1,
	    \},
	    \{
	    \ 'path': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Writting/',
	    \ 'name':'Writting Prompts',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Writting/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \},
	    \{
	    \ 'path': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Blog/',
	    \ 'name':'Blog',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': '~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes/Blog/site_html/',
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \},
	    \]

" Automatically export vimwiki to html
" \ 'auto_export':1,
" 'auto_tags':1

" Mapping to generate html for all vimwiki files
nnoremap <leader>wa :VimwikiAll2HTML<CR>

" Set Title as File Name
" au BufNewFile *.md :r!echo %:t:r;

" use <tab> to jump to next sections and snippets in insert mode
let g:vimwiki_table_mappings = 0

""""""""""""
"  Macros  "
""""""""""""

" Macro to create new vimwiki + title with @t
" let @q = 'BwYv$<Enter>PBx='
" let @q = 'BwYv$'

" Macro to add 3 trailing space to indent markdown files
" let @i = '$a   \<Esc>'   

"""""""""""""""""""""""""
"  Vimwik HTML Configs  "
"""""""""""""""""""""""""

" New lines in list item are converted in <br> in html file
let g:vimwiki_list_ignore_newline = 0
let g:vimwiki_text_ignore_newline = 0
" let g:vimwiki_html_header_numbering = 0

""""""""""""""""""""""""""
"  vim.calendar Configs  "
""""""""""""""""""""""""""

let g:calendar_task_delete = 1

