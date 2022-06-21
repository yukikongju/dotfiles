" NERDCommenter Configs
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDToggleCheckAllLines = 1

" vim-closetag Configs
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
	    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
	    \ 'javascript.jsx': 'jsxRegion',
	    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Configs for bullet.vim (checkboxes)
let g:bullets_checkbox_markers = ' .oOX'
let g:bullets_enabled_file_types = [
	    \ 'markdown',
	    \ 'text',
	    \ 'gitcommit',
	    \]

" Configs for vim-expand-region
" vmap v <Plug>(expand_region_expand)
" vmap <C-v> <Plug>(expand_region_shrink)

" Configs for vim-peekaboo
let g:peekaboo_window = 'vertical botright 50new'


" T-mux
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
" nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" let g:tmux_navigator_disable_when_zoomed = 1

