# Dotfiles

Keeping track of my Dotfiles by using symlink

## Table of Contents

1. [Requirements](#requirements)
2. [Setting Up dotfiles](#setup)
3. [What does .vimrc do](#what)
4. [Troubleshooting](#troubleshooting)

## Requirements

- [ ] Download Plugin manager from junegunn/vim-plug: `` curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ``
- [ ] Enable Symbolic Links on Git Bash: ``export MSYS=winsymlinks:nativestrict``

- [ ] Download nodejs for coc.nvim: `` sudo apt-get install nodejs``

- [ ] Make vim a core editor: `` git config --global core.editor "vim"``

## Setting Up Dotfiles

`` ./install.sh ``

## What does .vimrc do

- [x] Git Integration
- [x] Autocomplete with coc.nvim
- [x] Fuzzy file finder with fzf
- [x] Snippets with ultisnips
- [x] Mappings Refractor
- [x] Windows Splitting with Tmux
- [x] Latex Compiler with <leader>ll
- [ ] PDF file opener
- [ ] Macros Integration
- [ ] Debugger with vimspector

## Ressources

- [x] Dotfiles Management by Fireship: https://www.youtube.com/watch?v=r_MpUP6aKiQ&t=510s
- [x] Splitting .vimrc file: https://vi.stackexchange.com/questions/5441/is-it-possible-and-useful-to-split-vimrc
- [x] Enabling Symbolic Links in Git Bash: https://github.community/t/git-bash-symbolic-links-on-windows/522/11
- [ ] Installing zsh: https://dev.to/zinox9/installing-zsh-on-windows-37em
- [ ] Download Unofficial Vim 8.2: https://itsfoss.com/vim-8-release-install/
