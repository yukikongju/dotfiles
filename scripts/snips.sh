#!/usr/bin/sh
mkdir -p ~/.vim/UltiSnips
for f in $(ls ~/dotfiles/.vim/UltiSnips); do
    unlink $HOME/.vim/UltiSnips/$f
    rm -rf $HOME/.vim/UltiSnips/$f
    ln -s ~/dotfiles/.vim/UltiSnips/$f ~/.vim/UltiSnips/$f
done

