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

setup_sym_links_dir() {
    dotfile_abs_path=$1
    directory_abs_path=$2

    # remove directory if exists
    if [ -d $directory_abs_path ]; then
	rm -r $directory_abs_path
    fi

    # creating directory
    mkdir $directory_abs_path

    # creating sym links for all files in path
    for f in $(find $dotfile_abs_path -type f); do
	# get dir_abs_file_path
	file_name="${f#$dotfile_abs_path/}"
	dir_abs_file_path=$directory_abs_path/$file_name

	# remove sym link if exists
	if [ -L $dir_abs_file_path ] && [ -e $dir_abs_file_path ]; then
	    echo "sym link exists. unlinking and removing it.."
	    unlink $dir_abs_file_path
	    rm $dir_abs_file_path
	fi

	# create sym link
	ln -s $f $dir_abs_file_path
    done
}

confirm_directory_config_override() {
    dotfile_abs_path=$1
    directory_abs_path=$2

    if [ -d $directory_abs_path ]; then
	echo "$directory_abs_path configuration already exists. Do you wish to override them? [Y/N]"
	read response
	if [ $response = "Y" ]; then
	    setup_sym_links_dir $dotfile_abs_path $directory_abs_path
	else
	    echo "Keeping old $directory_abs_path configs."
	fi
    else
	echo "Setting up Sym Links for Newsboat"
	setup_sym_links_dir $dotfile_abs_path $directory_abs_path
    fi
}

confirm_file_config_override() {
    config_file_name=$1

    if [ -f $config_file_name ]; then
	echo "A $config_file_namefile file already exists. Do you wish to replace it? [Y/N]"
	read response
	if [ response = "Y" ]; then
	    echo "overriding config file at $config_file_name.."
	    if [ -L $config_file_name ]; then
		unlink $config_file_name
		rm $config_file_name
	    fi
	    ln -s ~/dotfiles/$config_file_name $config_file_name
	fi
    else
	echo "Creating a sym link for $config_file_name"
	ln -s ~/dotfiles/$config_file_name $config_file_name
    fi
}

setup_node() {
    # TODO
    echo "\n --- Setting up node --- \n"

    # Download node, npm
    
    # 
}

setup_vim() {
    echo "\n --- Setting up Vim --- \n"
    # Download vim
    # $install_function vim

    # Download VimPlug
    if [ -f ~/.vim/autoload/plug.vim ]; then
	echo "Vim Plug already installed. Skipping..."
    else
	echo "Installing Vim Plug..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "Successfully installed VimPlug"
    fi

    # creating sym links for .vimrc
    confirm_file_config_override ~/.vimrc

    # TODO: creating sym links for ultisnips; vim files; coc-settings.json

}


setup_tmux() {
    echo "\n --- Setting up tmux ---\n"
    # Download tmux
    $install_function tmux

    # Download tmux plugin manager
    if [ -d ~/.tmux/plugins/tpm ]; then
	echo "tpm already installed. Skipping..."
    else
	echo "Installing tmux plugin manager (tpm)"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    # create sym link for tmux config
    confirm_file_config_override ~/.tmux.conf
}

setup_newsboat() {
    echo "\n --- Setting up newsboat --- \n"
    NEWSBOAT_DIR=~/.newsboat
    DOTFILE_NEWSBOAT_DIR=~/dotfiles/.newsboat

    # Download newsboat
    $install_function newsboat

    # create sym links for config and url files
    confirm_directory_config_override $DOTFILE_NEWSBOAT_DIR $NEWSBOAT_DIR
}

setup_lobster() {
    # TODO  
    echo "\n --- Setting up lobster --- \n"

    # Download lobster prerequisites

    # Download lobster

}

setup_bash_profile() {
    # TODO  
    echo "\n --- Setting up bash profile --- \n"


}

os_name=$(get_os_name)
echo "OS Name is: $os_name"
install_function=$(get_os_install_function $os_name)

# setup_vim
setup_tmux
# setup_newsboat
# setup_lobster

