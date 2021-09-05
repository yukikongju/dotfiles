"""""""""""""""""""""""""""""""""""""
"  Ack and Silver Searcher Configs  "
"""""""""""""""""""""""""""""""""""""
" setup ack
let g:ackprg = 'ag --nogroup --nocolor --column'
" let g:ackprg = 'ag --vimgrep'

" automatically open file with j or k (fix: doesn't go back to original file)
let g:ackpreview = 1

" enable blank search to run against word under cursor
let g:ack_use_cword_for_empty_search = 1

" use silver searcher with ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" prevent :Ack "<whatever>" from printing into terminal
" the problematic behavior isn't always there
" See: https://github.com/mileszs/ack.vim/issues/18
function AckSearch(string) abort
    let saved_shellpipe = &shellpipe
    let &shellpipe = '>'
    try
	" execute 'Ack!' shellescape(a:string, 1) " 1rst buffer-grep only
	execute 'Ack' shellescape(a:string, 1)
    finally
	let &shellpipe = saved_shellpipe
    endtry
endfunction

nnoremap <leader>sa :call AckSearch("")<left><left>
