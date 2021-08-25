#!/usr/bin/sh

#######################################################################
#                  Programs/Languages Installations                   #
#######################################################################

# function download_plugin_manager {
    # curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# }

function install_python {
    sudo apt-get install python3-pip
    sudo apt-get install python3-venv # create python-venv
}

function install_java {
    sudo apt install default-jre
    sudo apt install default-jdk # install javac compiler
}

function install_js {
    sudo apt-get install nodejs
    sudo apt-get install npm # js package manager
}

function install_latex {
    sudo apt install pdflatex
    sudo apt install evince
}

function install_fzf {
    # installing fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install # say yes to all

    # installing ctags
    sudo apt-get install ctags
}

# function install_font {
#     sudo apt-get install fonts-powerline
#     fc-cahce -vf
# }


#######################################################################
#                       Packages Installations                        #
#######################################################################

function install_js_packages {
    # Change npm permissions
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
    export PATH=~/.npm-global/bin:$PATH
    source ~/.profile

    # Install JS Packages
    npm install -g standard # js style formatting
}

function install_python_packages{
    pip3 install jedi-language-server # python autocomplete
    pip install pep8 # code formatting
    # pandas, html5lib, numpy, requests, BeautifulSoup4
}



#######################################################################
#                       Generate Symbolic Links                       #
#######################################################################

function generate_vim_sym_links {
    # generate sym links for vim configs in .vim/init
    mkdir -p ~/.vim/init
    for f in $(ls ~/dotfiles/.vim/init); do
	unlink $HOME/.vim/init/$f
	rm -rf $HOME/.vim/init/$f
	ln -s ~/dotfiles/.vim/init/$f ~/.vim/init/$f
    done

    # generate symbolic link for .vimrc
    unlink $HOME/.vimrc
    rm ~/.vimrc
    ln -s ~/dotfiles/.vimrc ~/.vimrc
}

function generate_coc_settings_sym_link{
    unlink $HOME/.vim/coc-settings.json
    rm $HOME/.vim/coc-settings.json
    ln -s ~/dotfiles/.vim/coc-settings.json ~/.vim/coc-settings.json
}

function generate_bashrc_sym_link{
    # generate symbolic link for .bashrc file
    unlink $HOME/.bashrc
    rm $HOME/.bashrc
    ln -s ~/dotfiles/.bashrc ~/.bashrc
    # generate symbolic link for .bash_aliases file
}


function generate_tmux_sym_links{
    unlink $HOME/.tmux.conf
    rm $HOME/.tmux.conf
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
}

function generate_snippets_sym_links{
    mkdir -p ~/.vim/UltiSnips
    for f in $(ls ~/dotfiles/.vim/UltiSnips); do
	unlink $HOME/.vim/UltiSnips/$f
	rm -rf $HOME/.vim/UltiSnips/$f
	ln -s ~/dotfiles/.vim/UltiSnips/$f ~/.vim/UltiSnips/$f
    done
}

generate_snippets_sym_links


#######################################################################
#                            Miscellaneous                            #
#######################################################################

function install_vim_plugins {
    printf "\n\n Installing Vim Pluggins...\n"
    # vim -E +PlugInstall +qall || true

    # allow french lang
    export LANG=fr.utf8
}


# Make vim main editor
# git config --global core.editor "vim"
# git config --global credential.helper=store

# reload all rc files
source ~/.bashrc
source ~/.zshrc
