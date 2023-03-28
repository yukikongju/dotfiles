" Thesaurus : https://github.com/preservim/vim-lexical

" set thesaurus+=/home/yukikongju/dotfiles/dictionary/mthesaur.txt
" let g:lexicon_file = '~/dotfiles/dictionary/mthesaur.txt'

let g:lexical#thesaurus = ['~/dotfiles/dictionary/mthesaur.txt',]
let g:lexical#spell = 1         " 0=disabled, 1=enabled
let g:lexical#spelllang = ['en_us', 'en_ca', ] " check :help spellfile.vim for more

let g:lexical#spell_key = '<leader>ss'
let g:lexical#thesaurus_key = '<leader>st'

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

