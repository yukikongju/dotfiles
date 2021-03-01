#!/usr/bin/sh

ln -s ~/.dotfiles/.vimrc ~/.vimrc

mkdir ~/.vim/init
ln -s ~/.dotfiles/.vim/init/apps.vim ~/.vim/init/apps.vim
ln -s ~/.dotfiles/.vim/init/colors.vim ~/.vim/init/colors.vim
ln -s ~/.dotfiles/.vim/init/coc.vim ~/.vim/init/coc.vim
ln -s ~/.dotfiles/.vim/init/functions.vim ~/.vim/init/functions.vim
ln -s ~/.dotfiles/.vim/init/git.vim ~/.vim/init/git.vim
ln -s ~/.dotfiles/.vim/init/mappings.vim ~/.vim/init/mappings.vim
ln -s ~/.dotfiles/.vim/init/snippets.vim ~/.vim/init/snippets.vim
ln -s ~/.dotfiles/.vim/init/tree.vim ~/.vim/init/tree.vim
ln -s ~/.dotfiles/.vim/init/utils.vim ~/.vim/init/utils.vim
ln -s ~/.dotfiles/.vim/init/vimspector.vim ~/.vim/init/vimspector.vim
