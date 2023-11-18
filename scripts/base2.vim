set nocompatible
filetype off
filetype plugin indent on

" Pluggins
call plug#begin('~/.vim/plugged')

" utils
Plug 'tpope/vim-repeat'            " can use . with other plugins
Plug 'dkarter/bullets.vim'         " check box easily
Plug 'iamcco/markdown-preview.vim' " Preview markdown file with :MarkdownPreview
Plug 'jiangmiao/auto-pairs'        " insert and delete brackets in pairs
Plug 'preservim/vim-lexical'       " use thesaurus to find synonym

" tmux
Plug 'christoomey/vim-tmux-navigator' " tmux and vim integration

" Sidebar
Plug 'scrooloose/nerdtree'      " view file directory
Plug 'mbbill/undotree'          " view all undo history
Plug 'liuchengxu/vim-which-key' " show all key bindings

" ctags
Plug 'preservim/tagbar' " show functions and import from ctags on tagbar

" File Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code Finder
Plug 'mileszs/ack.vim' " use :Ack in vim -> :Ack <pattern> <file>
Plug 'rking/ag.vim'    " use :Ag in vim -> SilverSearcher

" Colorscheme' & Syntax Highlight
Plug 'scrooloose/nerdcommenter'       " Change indentation behavior
Plug 'morhetz/gruvbox'                " Gruvbox color scheme
Plug 'ap/vim-css-color'               " Highlight colors in css files

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for all

" Snippets
Plug 'neoclide/coc-snippets'       " snippet with coc
Plug 'honza/vim-snippets'          " snippets for various languages
Plug 'SirVer/ultisnips'            " Ultimate snippet solution for vim
Plug 'gillescastel/latex-snippets' " latex snippets

" Latex compiler
Plug 'lervag/vimtex'

" Git
Plug 'tpope/vim-fugitive'     " generate page to view commit message
Plug 'airblade/vim-gitgutter' " Show diff

" Vimwiki
Plug 'vimwiki/vimwiki'               " create linked text files
Plug 'patrickdavey/vimwiki_markdown' " a better way to convert vimwiki to html


call plug#end()

" Syntax
syntax enable

" Autocompletion
set completeopt=longest,menuone
set shortmess+=c
set updatetime=300
set timeoutlen=500

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
set softtabstop=4

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

" Folding: zR
" set foldmethod=syntax
" set foldcolumn=1
" set foldlevelstart=5
" set foldnestmax=2

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

" copy to clipboard in linux
set clipboard=unnamedplus
" set clipboard=unnamed (for windows)

" Choose Leader
let mapleader=","

" Mappings:


" Remap ; to : in normal and vertical mode
nnoremap ; :
vnoremap ; :


" Remove/Add Space under cursor
nnoremap J mzJ`z
nnoremap K m`o<Esc>``


" Change Cursor Style based on mode
set cursorline " Highlight line under cursor
let &t_SI = "\<esc>[5 q" " I beam cursor for insert mode
let &t_EI = "\<esc>[2 q" " block cursor for normal mode
let &t_SR = "\<esc>[3 q" " underline cursor for replace mode

" edit and reload vim
nnoremap <silent> <leader>ve :tabnew $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>

