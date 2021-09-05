" trim white space
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TrailSpace
    autocmd!
    " autocmd BufWritePre * :call TrimWhiteSpace()
    autocmd BufWritePre python,java,javascript,latex :call TrimWhiteSpace()
augroup END

" Formating file on save
" autocmd bufwritepost *.js silent !standard --fix %
" au BufWrite * silent! :Autoformat

augroup RemoveEmptyLinesButOne
    autocmd FileType java,javascript,c
		\ autocmd! RemoveEmptyLinesButOne BufWritePost <buffer> silent! :g/^\_$\n\_^$/d
augroup END

" toggle between en and fr
function! ToggleSpellLang()
    if &spelllang =~# 'en'
	:set spelllang=fr
    else
	:set spelllang=en_ca
    endif
endfunction

" allows cursor change in tmux mode (untested)
" if exists('$TMUX')
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

