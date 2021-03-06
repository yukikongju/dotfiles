#!/usr/bin/sh

# get plugin manager (to test)
# curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# ln -s ~/.dotfiles/.vim/autoload/plug.vim ~/.vim/autoload/plug.vim

# generate symbolic links in $HOME directory
mkdir -p ~/.vim/init
ln -s ~/.dotfiles/.vim/init/apps.vim ~/.vim/init/apps.vim
ln -s ~/.dotfiles/.vim/init/colors.vim ~/.vim/init/colors.vim
ln -s ~/.dotfiles/.vim/init/coc.vim ~/.vim/init/coc.vim
ln -s ~/.dotfiles/.vim/init/fzf.vim ~/.vim/init/fzf.vim
ln -s ~/.dotfiles/.vim/init/functions.vim ~/.vim/init/functions.vim
ln -s ~/.dotfiles/.vim/init/git.vim ~/.vim/init/git.vim
ln -s ~/.dotfiles/.vim/init/mappings.vim ~/.vim/init/mappings.vim
ln -s ~/.dotfiles/.vim/init/snippets.vim ~/.vim/init/snippets.vim
# ln -s ~/.dotfiles/.vim/init/telescope.vim ~/.vim/init/telescope.vim
ln -s ~/.dotfiles/.vim/init/tree.vim ~/.vim/init/tree.vim
ln -s ~/.dotfiles/.vim/init/utils.vim ~/.vim/init/utils.vim
ln -s ~/.dotfiles/.vim/init/vimspector.vim ~/.vim/init/vimspector.vim
ln -s ~/.dotfiles/.vimrc ~/.vimrc

