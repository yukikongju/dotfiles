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

# Download pip for python
sudo apt-get install python3-pip
sudo apt-get install python3-venv


# Download jedi for python autocomplete
# pip3 install jedi-language-server
# pip install -U pylint --user

# Make vim main editor
# git config --global core.editor "vim"


