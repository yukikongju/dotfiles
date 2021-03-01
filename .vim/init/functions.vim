" trim white space
  fun! TrimWhiteSpace()
      let l:save = winsaveview()
      keeppatterns %s/\s\+$//e
      call winrestview(l:save)
  endfun

  augroup THE_PRIMAGEN
      autocmd!
      autocmd BufWritePre * :call TrimWhiteSpace()
  augroup END

