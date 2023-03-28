" trim white space
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TrailSpace
    autocmd!
    " autocmd BufWritePre * :call TrimWhiteSpace()
    autocmd BufWritePre python,java,javascript,latex,vim :call TrimWhiteSpace()
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

" Substitute All Pattern By New Pattern ex: GlobalSubstitute('test', 'testing')
function! GlobalSubstituteConfirm(old_pattern, new_pattern)
  execute '%s/' . a:old_pattern . '/' . a:new_pattern . '/gc'
endfunction

" TODO: word count



" text search
" vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
"     \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
" omap s :normal vs<CR>

" TODO: Compare two files


" Thesaurus Search under cursor
" function! Thesaurus()
"     let word = expand("<cword>")
"     if !word || word == ""
"         echo "No word under cursor"
"         return
"     endif
"     let thesaurus_result = thesaurus_query(word)
"     if !thesaurus_result || thesaurus_result == ""
"         echo "No thesaurus entry found"
"         return
"     endif
"     echo thesaurus_result
" endfunction



" allows cursor change in tmux mode (untested)
" if exists('$TMUX')
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

