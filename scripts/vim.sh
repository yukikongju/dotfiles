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

# Symbolic link for .tmux.conf
unlink $HOME/.tmux.conf
rm -rf $HOME/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf


# Symbolic link for coc-settings
unlink $HOME/.vim/coc-settings.json
rm -rf $HOME/.vim/coc-settings.json
ln -s ~/dotfiles/.vim/coc-settings.json ~/.vim/coc-settings.json
