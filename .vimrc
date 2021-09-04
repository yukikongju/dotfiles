set nocompatible
filetype off
filetype plugin indent on

" Pluggins
call plug#begin('~/.vim/plugged')

" utils
Plug 'szw/vim-maximizer' " Fix vim windows
Plug 'tpope/vim-repeat' " can use . with other plugins
Plug 'jiangmiao/auto-pairs' " insert and delete brackets in pairs
Plug 'dkarter/bullets.vim' " check box easily
" Plug 'voldikss/vim-floaterm' " popup terminal for vim

" tmux
" Plug 'christoomey/vim-tmux-navigator' " tmux and vim integration

" treesitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Sidebar
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree' " view all undo history
Plug 'liuchengxu/vim-which-key' " show all key bindings

" ctags
Plug 'preservim/tagbar' " show functions and import from ctags on tagbar
Plug 'universal-ctags/ctags' " ctags implementation

" file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter' " fzf look at project directory
Plug 'mhinz/vim-startify' " fancy start screen and session manager
" Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " ranger
" Plug 'ranger/ranger'
" Plug 'francoiscabrol/ranger.vim'

" colorscheme' & syntax highlight
Plug 'itchyny/lightline.vim' " colorscheme for vim modes
Plug 'scrooloose/nerdcommenter' " Change indentation behavior
Plug 'morhetz/gruvbox' " gruvbox color scheme
Plug 'ap/vim-css-color' " Highlight colors in css files
" Plug 'ryanoasis/nerd-fonts' " Install Nerd Font
" Plug 'ryanoasis/vim-devicons' " Use icons from ryanoasis/nerd-fonts
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/promptline.vim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for all
Plug 'vim-scripts/c.vim' " c/c++ ide
Plug 'artur-shaik/vim-javacomplete2' " autocomplete for java
" Plug 'dense-analysis/ale'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

" autoformat
Plug 'dhruvasagar/vim-table-mode' " markdown table formatting (may want to switch bc no <S-tab> behavior)
" Plug 'godlygeek/tabular' " Allows vim-markdown to work
" Plug 'plasticboy/vim-markdown' " markdown formatting
" Plug 'vim-autoformat/vim-autoformat' " Autoformat file on save
" Plug 'prettier/vim-prettier'

" snippets
Plug 'neoclide/coc-snippets'
Plug 'honza/vim-snippets' " snippets for various languages
Plug 'SirVer/ultisnips' " Ultimate snippet solution for vim
Plug 'gillescastel/latex-snippets'

" latex compiler
" Plug 'lervag/vimtex'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'  }

" debugger
Plug 'puremourning/vimspector'

" git
Plug 'tpope/vim-fugitive' "generate page to view commit message
Plug 'airblade/vim-gitgutter' " Show diff

" vimwiki
Plug 'vimwiki/vimwiki' " create linked text files
" Plug 'patrickdavey/vimwiki_markdown' " a better way to convert vimwiki to html
" Plug 'tools-life/taskwiki'
" Plug 'GothenburgBitFactory/taskwarrior' " task management

" app
" Plug 'itchyny/calendar.vim' " calendar
" Plug 'lfos/calcurse' "Calendar scheduling app
" Plug 'blindFS/vim-taskwarrior' " interface for taskwarrior task manager

call plug#end()

" Syntax
syntax on

" Autocompletion
set completeopt=longest,menuone
" set complete-=t " disable searching tags
" set complete-=i " disable import
set shortmess+=c
set updatetime=300
set timeoutlen=500
" set spelllang=en_ca
" set spelllang=fr
" set spellsuggest=fast,20 " don't show too much suggestion
" set omnifunc=syntaxcomplete#Complete

" Enable dictionary autocompletion in Markdown files and Git Commit Messages
autocmd FileType markdown,gitcommit,tex, setlocal spell
autocmd FileType markdown,gitcommit,tex setlocal complete+=kspell

" Activate Mouse Action
" set mouse=a

" Cursor
set scrolloff=8
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
set visualbell
" set noerrorbells
" set t_vb=

" Change Cursor Style based on mode
set cursorline " Highlight line under cursor
let &t_SI = "\<esc>[5 q" " I beam cursor for insert mode
let &t_EI = "\<esc>[2 q" " block cursor for normal mode
let &t_SR = "\<esc>[3 q" " underline cursor for replace mode

" Indentation and tabulation
" set wrap
set formatoptions=tcqrn1
set shiftwidth=4
set smarttab
set smartindent
set autoindent
set noshiftround
" set tabstop=4
set softtabstop=4 " number of spaces in tab

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
set title

" Rendering
set ttyfast

" Encoding
set encoding=UTF-8

" Folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=5 " open all fold nested below n level deep
set foldnestmax=2

" Enable fold for js
autocmd FileType javascript,java setlocal foldmethod=syntax
let javaScript_fold=1

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

" test to view latex file
let g:livepreview_previewer = 'pdflatex'
let g:livepreview_engine = 'evince' . ' [options]'

" Configs ale
" let b:ale_fixers = { 'javascript': ['prettier', 'eslint'] }
" let g:ale_completion_autoimport = 1
" let g:ale_completion_enabled = 1
" let g:ale_fix_on_sabe = 1

" airline Configs
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline_theme='gruvbox'

" Fix JSON indentation
" augroup Indentation
" autocmd!
" autocmd FileType javascript set shiftwidth=2
" augroup END

" Vim Configs
source ~/.vim/init/coc.vim
source ~/.vim/init/colors.vim
source ~/.vim/init/fzf.vim
source ~/.vim/init/functions.vim
source ~/.vim/init/git.vim
source ~/.vim/init/mappings.vim
source ~/.vim/init/snippets.vim
source ~/.vim/init/startify.vim
source ~/.vim/init/tmux.vim
source ~/.vim/init/tree.vim
source ~/.vim/init/utils.vim
source ~/.vim/init/vimspector.vim
source ~/.vim/init/vimwiki.vim
source ~/.vim/init/which-key.vim
