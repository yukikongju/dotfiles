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
	    \ 'Career': {'name': 'Career', 'frequency': 'daily'},
	    \ 'Logs': {'name': 'Logs', 'frequency': 'daily'},
	    \ 'Journal': {'name': 'Journal', 'frequency': 'daily'},
	    \ 'Blog': {'name': 'Blog', 'frequency': 'daily'},
	    \ 'Writeups': {'name': 'Writeups', 'frequency': 'daily'},
	    \ 'WhatIveLearned': {'name': 'What I have learned', 'frequency': 'daily'},
	    \ 'Rant': {'name': 'Rant', 'frequency': 'daily'},
	    \ }

	    " \ 'Tests': {'name': 'Tests', 'frequency': 'weekly'},


let g:vimwiki_list = []
for [key, val] in items(g:vimwiki_folder_dct)
    call add(g:vimwiki_list, {
	    \ 'path': _vimwiki_base_path . "/" . key . "/",
	    \ 'name': val['name'],
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md',
	    \ 'path_html': _vimwiki_base_path . "/" . key . "/site_html/",
	    \ 'diary_rel_path': 'diary/',
	    \ 'diary_index': 'diary',
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
            \ 'headers': 1,
            \ 'text_objs': 1,
            \ 'table_format': 1,
            \ 'table_mappings': 0,
            \ 'lists': 1,
            \ 'links': 1,
            \ 'html': 1,
            \ 'mouse': 1,
            \ }

" \ 'global': 1,

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

" ---- Configs Markdown-preview
" set to 1, nvim will open the preview window after entering the Markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, Vim will refresh Markdown when saving the buffer or
" when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be used for all files,
" by default it can be use in Markdown files only
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, the preview server is available to others in your network.
" By default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page.
" Useful when you work in remote Vim and preview on local browser.
" For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page URL in command line when opening preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom Vim function name to open preview page
" this function will receive URL as param
" default is empty
let g:mkdp_browserfunc = ''

" options for Markdown rendering
" mkit: markdown-it options for rendering
" katex: KaTeX options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: whether to disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: means the cursor position is always at the middle of the preview page
"   top: means the Vim top viewport always shows up at the top of the preview page
"   relative: means the cursor position is always at relative positon of the preview page
" hide_yaml_meta: whether to hide YAML metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom Markdown style. Must be an absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style. Must be an absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" use a custom location for images
" let g:mkdp_images_path = /home/user/.markdown_images

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'dark'

" combine preview window
" default: 0
" if enable it will reuse previous opened preview window when you preview markdown file.
" ensure to set let g:mkdp_auto_close = 0 if you have enable this option
let g:mkdp_combine_preview = 0

" auto refetch combine preview contents when change markdown buffer
" only when g:mkdp_combine_preview is 1
let g:mkdp_combine_preview_auto_refresh = 1
"

