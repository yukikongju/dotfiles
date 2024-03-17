#!/bin/sh

get_os_name() {
    os_uname=$(uname -s)
    case $os_uname in 
	Linux*) echo "Linux";;
	Darwin*) echo "macOS";;
	CYGWIN*) echo "Cygwin";;
	MINGW*) echo "MinGW";;
	*) echo "unknown";;
    esac
}

get_os_install_function() {
    os_name="$1"
    case $os_name in 
	Linux*) echo "sudo apt install";;
	macOS*) echo "brew install";;
	Cygwin*) echo "choco install";;
	Mingw*) echo "choco install";;
	*) echo "unknown";;
    esac
}

setup_node() {
    # TODO

}

setup_vim() {
    echo "\n --- Setting up Vim --- \n"
    # Download vim

    # Download VimPlug
    if [ -f ~/.vim/autoload/plug.vim ]; then
	echo "Vim Plug already installed. Skipping..."
    else
	echo "Installing Vim Plug..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "Successfully installed VimPlug"
    fi

    # creating sym links for .vimrc
    if [ -f ~/.vimrc ]; then
	echo "A vimrc file already exists. Do you wish to replace it? [Y/N]"
	read replace
    else
	echo "Creating a sym link for .vimrc"
	ln -s ~/dotfiles/.vimrc ~/.vimrc
    fi

    # creating sym links for ultisnips; vim files; coc-settings.json

}


setup_tmux() {
    echo "\n --- Setting up tmux ---\n"
    # Download tmux
    # $install_function tmux

    # Download tmux plugin manager
    if [ -d ~/.tmux/plugins/tpm ]; then
	echo "tpm already installed. Skipping..."
    else
	echo "Installing tmux plugin manager (tpm)"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    # create sym link for tmux config
}

setup_newsboat() {
    # TODO  
    echo "\n --- Setting up newsboat --- \n"
}

setup_lobster() {
    # TODO  
    echo "\n --- Setting up loabster --- \n"
}

setup_bash_profile() {
    # TODO  
    echo "\n --- Setting up bash profile --- \n"
}



os_name=$(get_os_name)
echo "OS Name is: $os_name"
install_function=$(get_os_install_function $os_name)

setup_vim
setup_tmux
# setup_newsboat
# setup_lobster

