"""""""""""""""""""""
"  vimwiki Configs  "
"""""""""""""""""""""
" https://vimwiki.github.io/vimwikiwiki/Tips%20and%20Snips.html


let g:vimwiki_folding='expr' "list, '', expr, syntax,

" let g:vimwiki_global_ext = 0 " turn off creation of local wikis
" let g:vimwiki_conceallevel = 0
" let g:vimwiki_table_mappings = 1
" let g:vimwiki_folding_disabled = ['table', 'pre']
" let g:vimwiki_auto_header = 1
" let g:vimwiki_autowriteall = 1
" let g:vimwiki_html_header = '<header>'
" let g:vimwiki_html_footer = '</footer>'
" let g:vimwiki_html_template = '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>$title</title></head><body>$toc$body</body></html>'
" let g:vimwiki_pandoc_use_xelatex = 1
" let g:vimwiki_pandoc_args = '--mathjax -s -f markdown+tex_math_dollars+raw_tex'
" let g:vimwiki_pandoc_templates = {'html5': '$HOME/vimwiki/templates/pandoc-template.html'}
" let g:vimwiki_all2html_args = '-f markdown+tex_math_dollars+raw_tex -t html5 --mathjax'
" let g:vimwiki_all2html_postprocessor = 'tidy -q -i -w 1000 -c -utf8'



" change vimwiki base path based on os
if has('win32') || has('win64')
    let _vimwiki_base_path = "C:\Users\emuli\OneDrive - Universite de Montreal\VimWikiNotes"
elseif has("mac")
    let _vimwiki_base_path = "~/Projects/VimwikiNotes"
elseif has('unix')
    let _vimwiki_base_path = "~/Insync/emulie.chhor@umontreal.ca/OneDrive Biz/VimWikiNotes"
endif

" Subfolders: WhatIveLearned, Logs, Rant, Journal, Career, Blog

" not implemented yet: frequency: daily, weekly, monthly, quarterly, yearly
let g:vimwiki_folder_dct = {
	    \ 'WhatIveLearned': {'name': 'What I have learned', 'frequency': 'daily'},
	    \ 'Logs': {'name': 'Logs', 'frequency': 'daily'},
	    \ 'Rant': {'name': 'Rant', 'frequency': 'daily'},
	    \ 'Journal': {'name': 'Journal', 'frequency': 'daily'},
	    \ 'Career': {'name': 'Career', 'frequency': 'daily'},
	    \ 'Blog': {'name': 'Blog', 'frequency': 'daily'},
	    \ 'TODOs': {'name': 'TODOs', 'frequency': 'daily'},
	    \ 'Tests': {'name': 'Tests', 'frequency': 'weekly'},
	    \ }

let g:vimwiki_list = []
for [key, val] in items(g:vimwiki_folder_dct)
    call add(g:vimwiki_list, {
	    \ 'path': _vimwiki_base_path . "/" . key . "/",
	    \ 'name': val['name'],
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': _vimwiki_base_path . "/" . key . "/site_html/",
	    \ 'custom_wiki2html': 'vimwiki_markdown',
	    \ 'template_ext': '.tpl',
	    \ 'auto_diary-index': 1,
	    \ 'auto_generate_tags': 1,
	    \ 'diary_frequency': val['frequency'],
	    \ })
endfor

" Map the function to <Leader>w<Leader>w for :VimwikiMakeDiaryNote
function! VimwikiSmartDiaryNote()
    let current_wiki = vimwiki#vars#get_wikilocal('path')
    let frequency = vimwiki#vars#get_wikilocal('diary_frequency')

    " Default diary path
    let diary_path = current_wiki . "diary/"

    " Determine file name based on frequency
    if frequency ==# 'weekly'
        let diary_note = diary_path . strftime("%Y-W%V") . ".md"
    elseif frequency ==# 'monthly'
        let diary_note = diary_path . strftime("%Y-%m") . ".md"
    elseif frequency ==# 'yearly'
        let diary_note = diary_path . strftime("%Y") . ".md"
    else
        let diary_note = diary_path . strftime("%Y-%m-%d") . ".md"
    endif

    " Ensure the directory exists
    if !isdirectory(diary_path)
        call mkdir(diary_path, "p")
    endif

    " Open the diary note
    execute "edit " . diary_note
endfunction
nnoremap <Leader>w<Leader>w :call VimwikiSmartDiaryNote()

" TODO: Map the function <Leader>wi :VimwikiDiaryIndex
" function! VimwikiCustomDiaryIndex()
"     let current_wiki = vimwiki#vars#get_wikilocal('path')
"     let frequency = vimwiki#vars#get_wikilocal('diary_frequency')

"     " Set the index file path
"     let index_file = current_wiki . "diary/index.md"

"     " Define the appropriate index format
"     if frequency ==# 'weekly'
"         let index_content = "= Weekly Diary Index =\n{{index target=\"diary/*-W*.md\"}}"
"     elseif frequency ==# 'monthly'
"         let index_content = "= Monthly Diary Index =\n{{index target=\"diary/*-*.md\"}}"
"     elseif frequency ==# 'yearly'
"         let index_content = "= Yearly Diary Index =\n{{index target=\"diary/*.md\"}}"
"     else
"         let index_content = "= Daily Diary Index =\n{{index target=\"diary/*.md\"}}"
"     endif

"     " Ensure the diary directory exists
"     if !isdirectory(current_wiki . "diary/")
"         call mkdir(current_wiki . "diary/", "p")
"     endif

"     " Write the index file
"     call writefile(split(index_content, "\n"), index_file)

"     " Open the diary index
"     execute "edit " . index_file
" endfunction

" Map the function to override :VimwikiDiaryIndex
" command! VimwikiDiaryIndex call VimwikiCustomDiaryIndex()


" Allow latex in vimwiki
" let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md', 'dvipng': 'dvipng'}]
" let g:vimwiki_latex_dvipng = 'dvipng'
" let g:vimwiki_latex_engine = 'vimtex'

" Automatically export vimwiki to html
" \ 'auto_export':1,
" 'auto_tags':1

" Mapping to generate html for all vimwiki files
nnoremap <leader>wa :VimwikiAll2HTML<CR>
" nnoremap <leader>wt :VimwikiTOC<CR>

" Set Title as File Name
" au BufNewFile *.md :r!echo %:t:r;

" use <tab> to jump to next sections and snippets in insert mode
" let g:vimwiki_table_mappins = 0
" Thanks to anton-fomin!: https://github.com/vimwiki/vimwiki/issues/1093
let g:vimwiki_key_mappings = {
            \ 'all_maps': 1,
            \ 'global': 1,
            \ 'headers': 1,
            \ 'text_objs': 1,
            \ 'table_format': 1,
            \ 'table_mappings': 0,
            \ 'lists': 1,
            \ 'links': 1,
            \ 'html': 1,
            \ 'mouse': 1,
            \ }


" THIS CODE FORBID US TO PRESS ENTER in mardkown files
" augroup VimwikiRemaps
"     autocmd!
"     " unmap tab in insert mode
"     autocmd Filetype vimwiki silent! iunmap <buffer> <Tab>
"     " remap table tab mappings to M-n M-p
"     autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-n> vimwiki#tbl#kbd_tab()
"     autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-p> vimwiki#tbl#kbd_shift_tab()
"     " on enter if completion is open, complete first element otherwise use
"     " default vimwiki mapping
"     autocmd Filetype vimwiki inoremap <silent><expr><buffer> <cr> pumvisible() ? coc#_select_confirm()
" augroup end

" " autocmd FileType markdown,rmarkdown,vimwiki " activates only on markdown, rmarkdown, and vimiwki filetypes
" "       \ inoremap <CR> <ESC>:VimwikiReturn 3 5<CR>| " enables insert mode vimwiki return mapping
" "       \ autocmd CompleteChanged * silent! iunmap <CR>| " disables insert mode mapping on complete changed
" "       \ autocmd CompleteDone * inoremap <CR> <ESC>:VimwikiReturn 3 5<CR> " re-enables the insert mode mapping


" remapping follow links

" to add to template to render math formulas
" <script type="text/javascript" src="<mathjax_folder>/es5/tex-chtml.js?config=TeX-AMS-MML_HTMLorMML"></script>



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
" let g:vimwiki_list_ignore_newline = 0
" let g:vimwiki_text_ignore_newline = 0
" let g:vimwiki_html_header_numbering = 0

""""""""""""""""""""""""""
"  vim.calendar Configs  "
""""""""""""""""""""""""""

" let g:calendar_task_delete = 1

