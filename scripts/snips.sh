#!/usr/bin/sh

# install snips on ubuntu
# mkdir -p ~/.vim/UltiSnips
# for f in $(ls ~/dotfiles/.vim/UltiSnips); do
#     unlink $HOME/.vim/UltiSnips/$f
#     rm -rf $HOME/.vim/UltiSnips/$f
#     ln -s ~/dotfiles/.vim/UltiSnips/$f ~/.vim/UltiSnips/$f
# done

# install snips on windows
mkdir -p ~/.config/coc/ultisnips
for f in $(ls ~/dotfiles/.vim/UltiSnips); do
    unlink $HOME/.config/coc/ultisnips/$f
    rm -rf $HOME/.config/coc/ultisnips/$f
    ln -s ~/dotfiles/.vim/UltiSnips/$f ~/.config/coc/ultisnips/$fdone
done



