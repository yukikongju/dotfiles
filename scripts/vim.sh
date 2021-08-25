#!/usr/bin/env bash

mkdir -p ~/.vim/init/
for f in $(ls ~/dotfiles/.vim/init); do
    unlink $HOME/.vim/init/$f
    rm -rf $HOME/.vim/init/$f
    ln -s ~/dotfiles/.vim/init/$f ~/.vim/init/$f
done

