#!/usr/bin/sh

# get plugin manager (to test)
# curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# ln -s ~/.dotfiles/.vim/autoload/plug.vim ~/.vim/autoload/plug.vim

# generate symbolic links in $HOME directory
mkdir -p ~/.vim/init
for f in $(ls ~/dotfiles/.vim/init); do
    unlink $HOME/.vim/init/$f
    rm -rf $HOME/.vim/init/$f
    ln -s ~/dotfiles/.vim/init/$f ~/.vim/init/$f
done

# generate symbolic link for .vimrc
unlink $HOME/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

# generate symbolic link for coc-settings.json
unlink $HOME/.vim/coc-settings.json
ln -s ~/dotfiles/.vim/coc-settings.json ~/.vim/coc-settings.json

# generate symbolic link for .bashrc file
unlink $HOME/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc

# generate symbolic link for .bash_aliases file


# generate symlinks for snippets
# mkdir -p ~/.vim/snippets
# for f in $(ls ~/dotfiles/.vim/snippets); do
    # unlink $HOME/.vim/snippets/$f
    # rm -rf $HOME/.vim/snippets/$f
    # ln -s ~/dotfiles/.vim/snippets/$f ~/.vim/snippets/$f
# done


