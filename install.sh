#!/usr/bin/sh

# get plugin manager (to test)
# curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# ln -s ~/.dotfiles/.vim/autoload/plug.vim ~/.vim/autoload/plug.vim

# generate symbolic links in $HOME directory
mkdir -p ~/.vim/init
for f in $(ls $HOME/.vim/init); do
    unlink $HOME/.vim/init/$f
    rm -rf $f
    ln -s ~/dotfiles/.vim/init/$f ~/.vim/init/$f
done

# generate symbolic link for .vimrc
unlink $HOME/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

