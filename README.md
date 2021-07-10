# Dotfiles

Keeping track of my Dotfiles by using symlink

## Table of Contents

1. [Requirements](#requirements)
2. [Setting Up dotfiles](#setup)
3. [What does .vimrc do](#what)
4. [Troubleshooting](#troubleshooting)
5. [Ressources](#ressorces)

## Requirements

- [x] Download Plugin manager from junegunn/vim-plug: `` curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ``
- [x] Enable Symbolic Links on Git Bash: ``export MSYS=winsymlinks:nativestrict``

- [x] Download nodejs for coc.nvim: `` sudo apt-get install nodejs``

- [x] Make vim a core editor: `` git config --global core.editor "vim"``
- [x] Download pdflatex to compile latex files: `` sudo apt-get pdflatex``

## Setting Up Dotfiles

#### Step 1: Download requirements

`` ./requirements.sh``

#### Step 2: Generate Symbolic Links

`` ./install.sh ``

#### Step 3: Install Plugin
`` :PlugInstall ``

## What does .vimrc do

Pluggins:
- [x] Git Integration
- [x] Autocomplete with coc.nvim
- [x] Fuzzy file finder with fzf
- [x] Snippets with ultisnips
- [x] Mappings Refractor
- [x] Windows Splitting with Tmux
- [x] Latex Compiler with ``<leader>ll``
- [ ] PDF file viewer
- [ ] Debugger with vimspector

Native:
- [ ] Navigating through errors using quickfix with ``:cn, :cp``
- [X] Using Buffers and Registers to yank previous entries with
      ``"<letter>yy`` and ``"<letter>p``
- [X] Using Ticks to save local file position with `` '<letter>`` and ``m<letter>``
- [X] Macros Integration with ``q<letter>`` and ``@<letter>``

## Ressources

- [x] Dotfiles Management by Fireship: https://www.youtube.com/watch?v=r_MpUP6aKiQ&t=510s
- [x] Splitting .vimrc file: https://vi.stackexchange.com/questions/5441/is-it-possible-and-useful-to-split-vimrc
- [x] Enabling Symbolic Links in Git Bash: https://github.community/t/git-bash-symbolic-links-on-windows/522/11
- [ ] Installing zsh: https://dev.to/zinox9/installing-zsh-on-windows-37em
- [ ] Download Unofficial Vim 8.2: https://itsfoss.com/vim-8-release-install/
- [ ] Setting up Jupyter Notebook with Python on Ubuntu: https://www.digitalocean.com/community/tutorials/how-to-set-up-jupyter-notebook-with-python-3-on-ubuntu-18-04

