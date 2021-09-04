#!/usr/bin/env bash

# Copy vim files
mkdir -p ~/.vim/init/
for f in $(ls ~/dotfiles/.vim/init); do
    unlink $HOME/.vim/init/$f
    rm -rf $HOME/.vim/init/$f
    ln -s ~/dotfiles/.vim/init/$f ~/.vim/init/$f
done

# Symbolic link for .vimrc
unlink $HOME/.vimrc
rm -rf $HOME/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
