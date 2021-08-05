# Dotfiles

Keeping track of my Dotfiles by using symlink

## Table of Contents

1. [Requirements](#requirements)
2. [Setting Up dotfiles](#setup)
3. [What does .vimrc do](#what)
4. [Troubleshooting](#troubleshooting)
5. [Ressources](#ressources)

## Requirements

- [X] Download Plugin manager from junegunn/vim-plug: `` curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ``
- [X] Enable Symbolic Links on Git Bash: ``export MSYS=winsymlinks:nativestrict``

- [X] Download nodejs for coc.nvim: `` sudo apt-get install nodejs``

- [X] Make vim a core editor: `` git config --global core.editor "vim"``
- [X] Download pdflatex to compile latex files: `` sudo apt-get pdflatex``

## Setting Up Dotfiles

#### Step 1: Download requirements

`` ./requirements.sh``

#### Step 2: Generate Symbolic Links

`` ./install.sh ``

#### Step 3: Install Plugin inside .vimrc file
`` :PlugInstall ``

## What does .vimrc do

Plugins:
- [X] Git Integration
- [X] File System Explorer with NERDTree and ``<leader>t`` and ``<leader>f``
- [X] Autocomplete with coc.nvim
- [X] Fuzzy file finder with fzf ``<c-f>``
- [ ] Snippets with ultisnips
- [X] Windows Splitting with tmux
- [X] Latex Compiler with ``<leader>ll``
- [ ] PDF file viewer
- [X] Debugger with vimspector and ``<leader>dd``
- [X] Check and Uncheck checkboxes with bullets.vim ``<leader>x``

Native:
- [X] Mappings Refractor
- [X] Navigating through errors using quickfix with ``:cn, :cp``
- [X] Global and local rename with ``<leader>a``
- [X] Using Buffers and Registers to yank previous entries with
      ``"<letter>yy`` and ``"<letter>p``
- [X] Using Ticks to save local file position with `` '<letter>`` and ``m<letter>``
- [X] Macros Integration with ``q<letter>`` and ``@<letter>``
- [X] Execute python script inside vim with ``<F7>``
- [X] Spelling Checker for Markdown files with errors fix suggestions with ``z=`` in normal mode
- [X] Open ``.vimrc`` file anywhere with ``<leader>ev``

## Ressources

- [Dotfiles Management by Fireship](https://www.youtube.com/watch?v=r_MpUP6aKiQ&t=510s)
- [Splitting .vimrc file](https://vi.stackexchange.com/questions/5441/is-it-possible-and-useful-to-split-vimrc)
- [Enabling Symbolic Links in Git Bash](https://github.community/t/git-bash-symbolic-links-on-windows/522/11)
- [Installing zsh](https://dev.to/zinox9/installing-zsh-on-windows-37em)
- [Download Unofficial Vim 8.2](https://itsfoss.com/vim-8-release-install/)
- [Setting up Jupyter Notebook with Python on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-set-up-jupyter-notebook-with-python-3-on-ubuntu-18-04)
- [Modern Coder's install fzf on terminal](https://www.youtube.com/watch?v=1a5NiMhqAR0)

