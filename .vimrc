set nocompatible
filetype off
filetype plugin indent on

" Pluggins
call plug#begin('~/.vim/plugged')

" utils
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree' " view all undo history
Plug 'szw/vim-maximizer' " Fix vim windows
Plug 'tpope/vim-repeat' " can use . with other plugins
Plug 'jiangmiao/auto-pairs' " insert and delete brackets in pairs
Plug 'tpope/vim-speeddating' "date shortcut"
Plug 'dhruvasagar/vim-dotoo' " todo scheduler (new)
Plug 'christoomey/vim-tmux-navigator' " tmux and vim integration

" Plug 'voldikss/vim-floaterm' " popup terminal for vim

" file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter' " fzf look at project directory

" colorscheme' & syntax highlight
Plug 'itchyny/lightline.vim' " colorscheme for vim modes
Plug 'scrooloose/nerdcommenter' " Change indentation behavior
Plug 'morhetz/gruvbox' " gruvbox color scheme
Plug 'ap/vim-css-color' " Highlight colors in css files

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for all
Plug 'vim-scripts/c.vim' " c/c++ ide
Plug 'artur-shaik/vim-javacomplete2' " autocomplete for java
" Plug 'pappasam/jedi-language-server' " (has to be install via pip?)

" autoformat
Plug 'vim-autoformat/vim-autoformat' " Autoformat file on save

" snippets
Plug 'neoclide/coc-snippets'
Plug 'honza/vim-snippets' " snippets for various languages
Plug 'SirVer/ultisnips' " Ultimate snippet solution for vim
Plug 'gillescastel/latex-snippets'
" Plug 'ervandew/supertab' "use tab for all completion
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

" latex compiler
" Plug 'lervag/vimtex'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'  }

" debugger
Plug 'puremourning/vimspector' "Debugger

" git
Plug 'tpope/vim-fugitive' "generate page to view commit message

" app
Plug 'vimwiki/vimwiki' " create linked text files and auto number
" Plug 'itchyny/calendar.vim' " calendar
" Plug 'lfos/calcurse' "Calendar scheduling app
" Plug 'blindFS/vim-taskwarrior' " taskwarrior task manager

call plug#end()

" Syntax
syntax on

" Autocompletion
set completeopt=menuone,longest
set shortmess+=c
set updatetime=300					" Faster Completion
" set omnifunc=syntaxcomplete#Complete

" Enable dictionary autocompletion in Markdown files and Git Commit Messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell
" set spelllang=eng

" Activate Mouse Action
" set mouse=a

" Cursor
set scrolloff=8
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
set visualbell
set cursorline " Highlight line under cursor
let &t_SI = "\<esc>[5 q" " I beam cursor for insert mode
let &t_EI = "\<esc>[2 q" " block cursor for normal mode
let &t_SR = "\<esc>[3 q" " underline cursor for replace mode

" Indentation and tabulation
set wrap
set formatoptions=tcqrn1
set shiftwidth=4
set smarttab
set smartindent
set autoindent
set noshiftround
" set tabstop=4
" set softtabstop=4 " number of spaces in tab

" Swapfiles
set nobackup
set nowritebackup
set noswapfile
set autowrite " save automatically before :next and :make

" File Stats
set ruler
set confirm

" Security
set modelines=0

" Status bar
set laststatus=2
set showmode
set showcmd
set wildmenu
set nostartofline
set signcolumn=yes
set colorcolumn=80
set title " Set Windows's title

" Rendering
set ttyfast

" Encoding
set encoding=utf-8

" Folding
set foldmethod=syntax
set foldlevelstart=5 " open all fold nested below n level deep
set foldnestmax=2

" Buffers
set hidden

" Line numbers
set number
set relativenumber

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Colorscheme
syntax enable
set t_Co=256
set background=dark
colorscheme gruvbox

" Choose Leader
let mapleader=","


" Work around to fix weird utf-8 ubiquitous char that makes vim enter in
" replace mode
set t_u7=

" solved python38.dll bug
" let &pythonthreedll ="C:/Python39/python39.dll"
" let g:pymode_python = 'python3'

" make python pretty
" let python_highlight_all = 1

" test to view latex file
let g:livepreview_previewer = 'pdflatex'
let g:livepreview_engine = 'evince' . ' [options]'

source ~/.vim/init/apps.vim
source ~/.vim/init/coc.vim
source ~/.vim/init/colors.vim
source ~/.vim/init/fzf.vim
source ~/.vim/init/functions.vim
source ~/.vim/init/git.vim
source ~/.vim/init/mappings.vim
source ~/.vim/init/snippets.vim
" source ~/.vim/init/telescope.vim
source ~/.vim/init/tree.vim
source ~/.vim/init/utils.vim
source ~/.vim/init/vimspector.vim
