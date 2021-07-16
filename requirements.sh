#!/bin/env

# Download plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download nodejs for coc.nvim autocomplete
sudo apt-get install nodejs

# Download latexmk to compile latex file
sudo apt install pdflatex
# sudo apt install latexmk

# Download mupdf to open pdf file
# sudo apt install mupdf

# Download pip and virtual environment for python
sudo apt-get install python3-pip
sudo apt-get install python3-venv

# Download jedi for python autocomplete
pip3 install jedi-language-server
# pip install -U pylint --user

# Make vim main editor
# git config --global core.editor "vim"

# install fzf for terminal
# ctrl+r: terminal command history
# ctrl+t: file finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install # say yes to all
source ~/.bashrc
source ~/.zshrc
sudo apt install fdclone



