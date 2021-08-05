let g:tmux_navigator_no_mappings = 1

" Keybindings doesn't work
nnoremap <silent> {a-h} :TmuxNavigateLeft<cr>
nnoremap <silent> {a-j} :TmuxNavigateDown<cr>
nnoremap <silent> {a-k} :TmuxNavigateUp<cr>
nnoremap <silent> {a-l} :TmuxNavigateRight<cr>
nnoremap <silent> {a-\} :TmuxNavigatePrevious<cr>

