#!/usr/bin/sh

#######################################################################
#                  Programs/Languages Installations                   #
#######################################################################

# Download Plugin Manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Python
sudo apt-get install python3-pip
sudo apt-get install python3-venv # create python-venv

# Install Java
sudo apt install default-jre
sudo apt install default-jdk # install javac compiler

# Install JavaScript
sudo apt-get install nodejs
sudo apt-get install npm # js package manager

# Install Latex Compiler
sudo apt install pdflatex

# Install File Manager
# sudo apt install fdclone

# install fzf for terminal
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install # say yes to all

#######################################################################
#                       Packages Installations                        #
#######################################################################

# Change npm permissions
 mkdir ~/.npm-global
 npm config set prefix '~/.npm-global'
 export PATH=~/.npm-global/bin:$PATH
 source ~/.profile

# Install JS Packages
npm install -g standard # js style formatting

# Install Python Packages
pip3 install jedi-language-server # python autocomplete

#######################################################################
#                       Generate Symbolic Links                       #
#######################################################################

# generate sym links for .vim/init
mkdir -p ~/.vim/init
for f in $(ls ~/dotfiles/.vim/init); do
    unlink $HOME/.vim/init/$f
    rm -rf $HOME/.vim/init/$f
    ln -s ~/dotfiles/.vim/init/$f ~/.vim/init/$f
done

# generate symbolic link for .vimrc
unlink $HOME/.vimrc
# rm ~/.vimrc
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

#######################################################################
#                            Miscellaneous                            #
#######################################################################

# Installing Vim Pluggins
printf "\n\n Installing Vim Pluggins...\n"
# vim -E +PlugInstall +qall || true

# Make vim main editor
git config --global core.editor "vim"

# reload all rc files
source ~/.bashrc
source ~/.zshrc
