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

override_sym_links_dir() {
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
	    override_sym_links_dir $dotfile_abs_path $directory_abs_path
	else
	    echo "Keeping old $directory_abs_path configs."
	fi
    else
	echo "Setting up Sym Links for Newsboat"
	override_sym_links_dir $dotfile_abs_path $directory_abs_path
    fi
}

confirm_file_config_override() {
    config_file_name=$1

    if [ -f $config_file_name ]; then
	echo "A $config_file_namefile file already exists. Do you wish to replace it? [Y/N]"
	read response
	if [ $response = "Y" ]; then
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

setup_python() {
    # TODO
    echo "\n --- Setting up Python --- \n"

    # install basic packages
    pip3 install pep8 jedi-language-server
    pip3 install jupyter
    pip3 install numpy pandas matplotlib seaborn sklearn

}

setup_r_lang() {
    # TODO
    echo "\n --- Setting up R --- \n"

    $install_function r-base r-base-core
    $install_function libcurl4-openssl-dev libssl-dev


}

setup_cpp() {
    # TODO: setup: https://blog.octoco.ltd/vim-coc-and-c-dbe99405f7bd
    echo "\n --- Setting Up C++ \n"

    # vim cpp setup: https://codevion.github.io/#!vim/coc.md
    # clangd: https://clangd.llvm.org/installation
    $install_function llvm ccls bear
}


setup_node() {
    # TODO
    echo "\n --- Setting up node --- \n"

    # download javascript, typescript

    # Download node, npm
    $install_function nodejs npm next vite
    
    # Download React, next.js

    # JS Packages
    npm install -g standard

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

    # TODO: Download fzf

    # Download fuzzy finder utils 
    $install_function tree ctags ack-grep ripgrep silversearcher-ag

    # Download vimwiki utils to generate HTML file
    pip install vimwiki-markdown
    $install_function dvipng

    # creating sym links for .vimrc
    confirm_file_config_override ~/.vimrc
    confirm_file_config_override ~/.ideavimrc

    # creating sym links for ultisnips; vim files; coc-settings.json
    ULTISNIPS_DIR=~/.vim/UltiSnips
    DOTFILE_ULTISNIPS_DIR=~/dotfiles/.vim/UltiSnips
    confirm_directory_config_override $DOTFILE_ULTISNIPS_DIR $ULTISNIPS_DIR

    VIM_SCRIPTS_DIR=~/.vim/init
    DOTFILE_VIM_SCRIPTS_DIR=~/dotfiles/.vim/init
    confirm_directory_config_override $DOTFILE_VIM_SCRIPTS_DIR $VIM_SCRIPTS_DIR

    confirm_file_config_override ~/.vim/coc-settings.json
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

    # updating tmux.cong file
    tmux source-file ~/.tmux.conf
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
    # https://github.com/justchokingaround/lobster#linux-from-source
    echo "\n --- Setting up lobster --- \n"

    # --- Install Prerequisites
    $install_function mpv

    # --- Installing Lobster
    echo "Installing Lobster.."
    if [ $os_name = "macOS" ]; then 
	curl -sL github.com/justchokingaround/lobster/raw/main/lobster.sh -o "$(brew --prefix)"/bin/lobster && chmod +x "$(brew --prefix)"/bin/lobster
	echo "Successfully installed Lobster"
    elif [ $os_name = "Linux" ]; then
	sudo curl -sL github.com/justchokingaround/lobster/raw/main/lobster.sh -o /usr/local/bin/lobster && sudo chmod +x /usr/local/bin/lobster
	echo "Successfully installed Lobster"
    else
	echo "Lobster installation not supported for your current OS."
    fi

}

setup_ohmyposh() {
    # TODO: setup oh-my-posh
    # https://ohmyposh.dev/docs/installation/macos

    echo "\n --- Setting up Oh-My-Posh --- \n"

    # installing oh-my-posh
    if [ $os_name = "macOS" ]; then
	brew install jandedobbeleer/oh-my-posh/oh-my-posh
	brew update && brew upgrade oh-my-posh
    elif [ $os_name = "Linux" ]; then
	curl -s https://ohmyposh.dev/install.sh | bash -s
    else
	echo "Oh-My-Posh installation for your current OS not supported"
    fi

    # install font from Nerd Font: Cascadia Cove
    oh-my-posh font install

    # Configure terminal/editor/shell to use font
    # eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/1_shell.omp.json)"
    # OHMYPOSH_THEME="1_shell"
    OHMYPOSH_THEME="amro"
    eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/$(OHMYPOSH_THEME).omp.json)"
    source ~/.zshrc

    # configure a theme / custom prompt configuration
    # For the macOS Terminal app:
    # Open Preferences, go to the Profiles tab, and in the Text section, click "Change" next to Font. Select the installed Nerd Font (e.g., "CaskaydiaCove Nerd Font" or "MesloLGM Nerd Font")1.
    # For VS Code:
    # Open Settings, search for "Terminal > Integrated: Font Family" and set it to "CaskaydiaCove NFM" or "MesloLGM Nerd Font"1.


}

setup_bash_profile() {
    # TODO  
    echo "\n --- Setting up bash profile --- \n"
}

setup_pandoc() {
    # TODO
    echo "\n --- Setting up Pandoc --- \n"
    $install_function pandoc 

    # install latexmk or MacTex
    # brew install --cask mactex
    # sudo apt install latexmk
    # which pdflatex
    # which latexmk

    # install xelatex: https://tug.org/mactex/mactex-download.html [5.7G]

    # install latex: -- https://tug.org/mactex/mactex-download.html
    latexmk bibtex
}

setup_zsh() {
    # TODO
    # Oh My zsh installation: https://ohmyz.sh/?ref=tcude.net#install
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # --- ZSH PLUGINS Installation

    # zsh-autosuggestions installation: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
    # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # zsh-autocomplete: https://github.com/marlonrichert/zsh-autocomplete
    # git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git

    # zsh-syntax-highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
    # echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc


    # symlink to zshrc
    confirm_file_config_override ~/.zshrc
}

os_name=$(get_os_name)
echo "OS Name is: $os_name"
install_function=$(get_os_install_function $os_name)

# setup_python
# setup_r_lang
# setup_node
# setup_vim
# setup_tmux
# setup_newsboat
# setup_lobster
# setup_bash_profile
# setup_pandoc
# setup_zsh
# setup_ohmyposh

