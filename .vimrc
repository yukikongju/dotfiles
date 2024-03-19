set nocompatible
filetype off
filetype plugin indent on

" Pluggins
call plug#begin('~/.vim/plugged')

" utils
Plug 'tpope/vim-repeat'            " can use . with other plugins
Plug 'tpope/vim-eunuch'            " use UNIX shell command in vim
Plug 'dkarter/bullets.vim'         " check box easily
Plug 'iamcco/markdown-preview.vim' " Preview markdown file with :MarkdownPreview
" Plug 'voldikss/vim-floaterm'       " popup terminal for vim with :terminal and :FloatermToggle
Plug 'jiangmiao/auto-pairs'        " insert and delete brackets in pairs
Plug 'godlygeek/tabular'           " align text based on regex => :Tabularize /<regex>
Plug 'dhruvasagar/vim-table-mode'  " markdown table formatting (may want to switch bc no <S-tab> behavior)
Plug 'preservim/vim-lexical'       " use thesaurus to find synonym

" tmux
Plug 'christoomey/vim-tmux-navigator' " tmux and vim integration

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Sidebar
Plug 'scrooloose/nerdtree'      " view file directory
Plug 'mbbill/undotree'          " view all undo history
Plug 'liuchengxu/vim-which-key' " show all key bindings

" ctags
Plug 'preservim/tagbar' " show functions and import from ctags on tagbar

" File Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter' " fzf look at project directory
Plug 'mhinz/vim-startify'  " fancy start screen and session manager

" Code Finder
Plug 'mileszs/ack.vim' " use :Ack in vim -> :Ack <pattern> <file>
Plug 'rking/ag.vim'    " use :Ag in vim -> SilverSearcher


" Colorscheme' & Syntax Highlight
Plug 'itchyny/lightline.vim'          " Colorscheme for vim modes
Plug 'scrooloose/nerdcommenter'       " Change indentation behavior
Plug 'morhetz/gruvbox'                " Gruvbox color scheme
Plug 'ap/vim-css-color'               " Highlight colors in css files
Plug 'ryanoasis/vim-devicons'         " Use icons from ryanoasis/nerd-fonts
Plug 'vim-airline/vim-airline'        " Status Bar
Plug 'vim-airline/vim-airline-themes' " More status bar themes

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for all
" Plug 'pixelneo/vim-python-docstring'            " generate docstring for python
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " DOcumentation GEnerator
Plug 'lunacookies/vim-sh' " syntax highlight for sh

" autocomplete for react development
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Snippets
Plug 'neoclide/coc-snippets'       " snippet with coc
Plug 'honza/vim-snippets'          " snippets for various languages
Plug 'SirVer/ultisnips'            " Ultimate snippet solution for vim
Plug 'gillescastel/latex-snippets' " latex snippets
Plug 'vim-latex/vim-latex'

" Latex compiler
Plug 'lervag/vimtex'

" Debugger
Plug 'puremourning/vimspector'

" Python Console
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
" Plug 'ivanov/vim-ipython'

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
" set complete-=t " disable searching tags
" set complete-=i " disable import
set shortmess+=c
set updatetime=300
set timeoutlen=500
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

" Enable fold for js
" autocmd FileType javascript,java setlocal foldmethod=syntax
" autocmd FileType python setlocal foldmethod=indent
" let javaScript_fold=1
" autocmd FileType markdown setlocal foldmethod=expr

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
if has('win32') || has('win64')
    set clipboard=unnamed (for windows)
elseif has('mac')
    set clipboard^=unnamed,unnamedplus " (mac)
else
    set clipboard=unnamedplus (linux)
endif

" Choose Leader
let mapleader=","

" Work around to fix weird utf-8 ubiquitous char that makes vim enter in replace mode
set t_u7=

" Configs for vim-latex-live-preview
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex' . ' [options]'

"
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

" automatically change the current directory
" autocmd BufEnter * silent! lcd %:p:h
" set autochdir

" Allow fold inside Markdown (vim-markdown)
" let g:markdown_folding = 1

" Allow <Enter> key in markdown file (fixing autocomplete) CHECK!
" autocmd FileType Markdown inoremap <buffer><silent><expr> <CR> coc#_select_confirm()
autocmd FileType markdown inoremap <buffer><silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"


" open latex on side screen

" airline Configs
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='gruvbox'

" TREESITTER CONFIGS TODO: move into its own file

" vim-ipython CONFIGS:
let g:slime_python_ipython = 1

" CPP CONFIGS:
" set path+=./include " make vim recognize include files
let c_comment_strings = 0


" Python PEP 7 & 8: https://svn.python.org/projects/python/trunk/Misc/Vim/vimrc
" au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
" au BufRead,BufNewFile *.py,*.pyw set expandtab
" fu Select_c_style()
"     if search('^\t', 'n', 150)
"         set shiftwidth=8
"         set noexpandtab
"     el 
"         set shiftwidth=4
"         set expandtab
"     en
" endf
" au BufRead,BufNewFile *.c,*.h call Select_c_style()
" au BufRead,BufNewFile Makefile* set noexpandtab

" highlight BadWhitespace ctermbg=red guibg=red
" au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
" au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
" au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix


" Deactivate Vim Rooter echoing ( only echoes for Vimwiki)
let g:rooter_silent_chdir = 1

" Vim Configs
source ~/.vim/init/ack.vim
source ~/.vim/init/colors.vim
source ~/.vim/init/coc.vim
source ~/.vim/init/fzf.vim
source ~/.vim/init/functions.vim
source ~/.vim/init/git.vim
source ~/.vim/init/mappings.vim
source ~/.vim/init/snippets.vim
source ~/.vim/init/startify.vim
source ~/.vim/init/thesaurus.vim
source ~/.vim/init/tmux.vim
source ~/.vim/init/tree.vim
source ~/.vim/init/utils.vim
source ~/.vim/init/vimspector.vim
source ~/.vim/init/vimwiki.vim
source ~/.vim/init/which-key.vim

" Load pluggins: IDK why it doesn't automatically
" source ~/.vim/plugged/


" run .profile
" source ~/.profile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Old plugins                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Plug 'jceb/vim-orgmode' " task management with .org file 
" Plug 'xolox/vim-notes' " Note Taking in Vim using :Note
" Plug 'esensar/vimwiki-reviews-lua' " reviews vimwiki by week, month, year
" Plug 'GothenburgBitFactory/taskwarrior' " task management
" Plug 'tools-life/taskwiki'

" app
" Plug 'itchyny/calendar.vim' " calendar
" Plug 'lfos/calcurse' "Calendar scheduling app
" Plug 'blindFS/vim-taskwarrior' " interface for taskwarrior task manager


" Plug 'edkolev/promptline.vim'
" Plug 'sjbach/lusty' " Buffer-grep: find code in opened buffer (missing functionalities)
" Plug 'universal-ctags/ctags' " ctags implementation
" Plug 'vifm/vifm'
" Plug 'ranger/ranger'
" Plug 'szw/vim-maximizer'                                  " Fix vim windows
" Plug 'wincent/command-t'                                  " file buffers
" Plug 'terryma/vim-expand-region'                          " Press + to expand the visual selection and _ to shrink it.
" Plug 'junegunn/vim-peekaboo'                              " see the contents of registers with `'` and `@`
" Plug 'tpope/vim-rsi'                                      " Prevent key override
" Plug 'tpope/vim-sleuth'                                   " automatically adjust shiftwidth and expandtab
" Plug 'vim-scripts/c.vim' " c/c++ ide
" Plug 'artur-shaik/vim-javacomplete2' " autocomplete for java
Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'
" Plug 'fatih/vim-go'
" Plug 'neoclide/coc-tabnine'

" Plug 'neovimhaskell/haskell-vim'
" Plug 'tpope/vim-endwise' 

" Plug 'dense-analysis/ale'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'neovim/nvim-lspconfig'

" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'  }

" pandoc compiler
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" Plug 'godlygeek/tabulark " Allows vim-markdown to work
" Plug 'plasticboy/vim-markdown' " markdown formatting
" Plug 'vim-autoformat/vim-autoformat' " Autoformat file on save
" Plug 'prettier/vim-prettier'


