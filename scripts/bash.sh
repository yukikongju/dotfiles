#!/usr/bin/env sh

# Generate Sym Link for .bashrc
# unlink $HOME/.bashrc
# rm -rf $HOME/.bashrc
# ln -s ~/dotfiles/.bashrc ~/.bashrc

# Generate sym link for newsboat
unlink $HOME/.newsboat/urls
rm -rf $HOME/.newsboat/urls
ln -s ~/dotfiles/.newsboat/urls ~/.newsboat/urls
