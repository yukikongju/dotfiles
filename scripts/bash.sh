#!/usr/bin/env sh

# Generate Sym Link for .bashrc
unlink $HOME/.bashrc
rm -rf $HOME/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc

