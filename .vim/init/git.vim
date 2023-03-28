""""""""""""""""""""""
"  NERDTree Configs  "
""""""""""""""""""""""
let g:NERDTreeGitStatusShowIgnored = 1
" let g:NERDTreeGitStatusIndicatorMapCustom = {
"         \ "Modified"  : "✹",
"         \ "Staged"    : "✚",
"         \ "Untracked" : "✭",
"         \ "Renamed"   : "➜",
"         \ "Unmerged"  : "═",
"         \ "Deleted"   : "✖",
"         \ "Dirty"     : "✗",
"         \ "Clean"     : "✔︎",
          \ 'Ignored'   : '☒',
"         \ "Unknown"   : "?"
"         \ }
"
"

"""""""""""""""""""""""
"  GitGutter Configs  "
"""""""""""""""""""""""
" stage hunk: <leader>hs ; undo stage: <leader>hu; preview hunk: <leader>hp

highlight GitGutterAdd guifg=#008200 ctermfg=Green
highlight GitGutterChange guifg=#bbd100 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff9999 ctermfg=Red

" Disable key mapping
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1

" Keep vim snappy
let g:gitgutter_max_signs = 500 

" Jump between hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

" Customize symbols
" let g:gitgutter_sign_added = 'xx'
" let g:gitgutter_sign_modified = 'yy'
" let g:gitgutter_sign_removed = 'zz'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_removed_above_and_below = '{'
" let g:gitgutter_sign_modified_removed = 'ww'

" Check Hunk summary on GitStatus
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

