" Colorscheme
syntax enable
set t_Co=256
set background=dark
colorscheme gruvbox

" let g:solarized_termtrans=1

" lightline Configs
let g:lightline = {
	    \ 'colorscheme': 'gruvbox',
	    \ 'active': {
	    \   'left': [ [ 'mode', 'paste' ],
	    \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
	    \ },
	    \ 'component': {
	    \   'helloworld': ''
	    \ },
	    \ }
