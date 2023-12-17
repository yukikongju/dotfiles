#!/usr/bin/env sh

# Generate Sym Link for .bashrc
# unlink $HOME/.bashrc
# rm -rf $HOME/.bashrc
# ln -s ~/dotfiles/.bashrc ~/.bashrc

# Generate sym link for newsboat
unlink $HOME/.newsboat/urls
unlink $HOME/.newsboat/config
rm -rf $HOME/.newsboat/
mkdir $HOME/.newsboat/
ln -s ~/dotfiles/.newsboat/urls ~/.newsboat/urls
ln -s ~/dotfiles/.newsboat/config ~/.newsboat/config
