#!/usr/bin/sh

#######################################################################
#                  Programs/Languages Installations                   #
#######################################################################

# function download_plugin_manager {
    # curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# }
#

function install_lobster {
    # https://github.com/justchokingaround/lobster#linux-from-source
    sudo curl -sL github.com/justchokingaround/lobster/raw/main/lobster.sh -o /usr/local/bin/lobster &&
    sudo chmod +x /usr/local/bin/lobster

    sudo apt install mpv
}

function install_opencv {
    # https://www.geeksforgeeks.org/how-to-install-opencv-in-c-on-linux/
    # sudo ln -s /usr/local/include/opencv4/opencv2 /usr/local/include/opencv2
    sudo apt-get -y install libopencv-dev

}


function install_libgen {
    sudo npm install -g libgen-downloader
    sudo apt install fbreader
}

function install_wpscan {
    sudo gem install nokogiri wpscan
}


function install_go {
    # https://www.digitalocean.com/community/tutorials/how-to-install-go-on-ubuntu-20-04
     go install github.com/ffuf/ffuf/v2@latest
}

function install_weylus { 
    # https://ubunlog.com/en/weylus-convierte-telefono-tableta-en-pantalla-tactil-para-escritorio/
    # https://xournalpp.github.io/installation/linux/
}

function install_zsh{
    # https://dev.to/yogeshdev/make-your-unix-terminal-beautiful-productive-c1d
    sudo apt install zsh

    # managing zsh configuration
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}


function install_sioyek {
    # https://flatpak.org/setup/Ubuntu
    # https://flathub.org/apps/details/com.github.ahrm.sioyek
    sudo apt install flatpak
    sudo apt install gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub com.github.ahrm.sioyek
    # flatpak run com.github.ahrm.sioyek

    # echo "alias sioyek='flatpak run com.github.ahrm.sioyek'" > ~/.bashrc
}

function install_gobuster {
    # https://www.cyberithub.com/how-to-install-gobuster-on-ubuntu-20-04-lts/
    # https://hackertarget.com/gobuster-tutorial/
    go install github.com/OJ/gobuster/v3@latest
    export PATH=$PATH:~/go/bin
}

function install_hashcat {
    apt-get install ocl-icd-libopencl1 opencl-headers clinfo
}

function install_haskell {
    sudo apt-get install haskell-stack threadscope
}


function install_qt {
    # https://stackoverflow.com/questions/48147356/install-qt-on-ubuntu
    sudo apt-get install build-essential
    sudo apt-get install qtcreator
    sudo apt-get install qt5-default
    sudo apt-get install qt5-doc
    sudo apt-get install qt5-doc-html qtbase5-doc-html
    sudo apt-get install qtbase5-examples
}


function install_pandoc {
    # https://github.com/alexeygumirov/pandoc-beamer-how-to
    sudo apt update
    sudo apt install pandoc
    sudo apt install imagemagick
    sudo apt install texlive-latex-recommended
    sudo apt install texlive-fonts-recommended
    sudo apt install texlive-latex-extra
    sudo apt install texlive-fonts-extra
    sudo apt install texlive-xetex
}

function install_docker {
    sudo apt-get install docker.io
    sudo systemctl enable docker
}

function install_conda {
    # https://varhowto.com/install-miniconda-ubuntu-20-04/
    # after conda has been installed
    conda install cudotoolkit
}

function install_db {
    sudo apt install sqlite3
}

function install_linux_system_tools {
    sudo apt install net-tools
}

function install_vimium {
    # https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
    
    # justify text
    sudo apth install par
}


function install_rust { # cargo
    # https://rust-lang.github.io/rustup/installation/index.html
    sudo apt install rustc
    sudo snap install rustup --classic
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy
    rustup toolchain link system /usr
    rustup toolchain install nightly
    rustup component add rustfmt --toolchain nightly
    # rustup default nightly

    # install librairies
    cargo install xbuild
    cargo install cargo-sysroot

    # install rust autocomplete: https://www.youtube.com/watch?v=LfJZboTeDt0&t=71s
    # https://github.com/neoclide/coc-rls
    rustup component add rls rust-analysis rust-src
}

function install_browser {
    sudo apt install lynx
}

function install_sound {
    sudo apth install libasound2-dev
}

function install_python { # pip
    sudo apt-get install python3-pip
    sudo apt-get install python3-venv # create python-venv
    sudo apt-get install jedi-language-server
}

function install_java {
    sudo apt install default-jre
    sudo apt install default-jdk # install javac compiler
}

function install_r {
    sudo apt-get install libcurl4-openssl-dev libcairo2-dev libudunits2-dev
    sudo apt-get install pkg-config
    sudo apt install libssl-dev
    sudo apt-get install font-manager
    sudo apt-get install font-manager
    sudo apt-get install libgdal-dev
    sudo apt install ffmpeg
}

function install_js {
    sudo apt-get install nodejs
    sudo apt-get install npm # js package manager
}

function install_jekyll {
    sudo apt-get install ruby-full build-essential zlib1g-dev
    sudo gem install jekyll bundler
    sudo gem install jekyll jekyll-feed jekyll-gist jekyll-paginate jekyll-sass-converter jekyll-coffeescript
    gem install minima jekyll-feed
    sudo apt install ruby-bundler
    sudo bundle install

}

function install_flameshot {
    # install screenshot : https://askubuntu.com/questions/1036473/how-to-change-screenshot-application-to-flameshot-on-ubuntu-18-04
    sudo apt install flameshot
}

function install_htb {
    sudo apt install openvpn
    sudo apt install golang-go
}


function install_bottom {
    # cpu app usage: https://www.linode.com/docs/guides/installing-and-using-bottom-on-linux/
    curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb
    sudo dpkg -i bottom_0.6.3_amd64.deb
}


function install_latex {
    # https://linuxconfig.org/how-to-install-latex-on-ubuntu-20-04-focal-fossa-linux
    sudo apt install pdflatex
    npm install wallpaper
    sudo apt install evince
    sudo apt install zathura
    sudo apt-get install texlive-latex-recommended texlive texlive-base texlive-full
}

function swap_caps_escape {
    # for windows: https://github.com/susam/uncap: uncap 0x1b:0x14
    # https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc
    setxkbmap -option caps:swapescape
}

function install_CTfs {
    sudo apt install nmap
    # sudo apt install gobuster
    sudo apt install smbclient
}

function install_matrix {
    # matrix background
    sudo apt install cmatrix
}


function install_sql {
    sudo apt install mysql*
}

function install_calibre {
    sudo apt install calibre
}

function install_onenote {
    sudo snap install onenote-desktop
}

function install_microsoft_office {
    # https://gist.github.com/raelgc/4ccc023830bfd12c0227
    # https://www.youtube.com/watch?v=vTakHpggAMs
    sudo apt install wine
    sudo apt install winetricks
}

function install_tree {
    # install tree . to view tree-like directory view
    sudo apt install tree
    sudo apt install locate # locate file: locate xxcd
}

function install_fzf {
    # installing fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install # say yes to all

    # installing ctags
    sudo apt-get install ctags
}

function install_window_manager {
    sudo apt install i3
    sudo apt install i3-wm
}

function install_ack { # code searcher
    # install grep, ack, silversearcher
    sudo apt-get install ack-grep ripgrep silversearcher-ag

    # install vim+ruby
    sudo apt-get install vim-nox vim-rails
}

function install_tmux {
    sudo apt-get install tmux
}

function install_taskwarrior {
    sudo apt install taskwarrior
}

function install_vimwiki {
    # generate HTML files
    pip install vimwiki-markdown
    sudo apt install dvipng
}

function install_ranger {
    sudo apt install ranger-fm
    # add dependecies to preview pictures on ranger
    sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev
}

function install_r {
    # https://www.youtube.com/watch?v=iN0UZ43G6GE
    # https://cloud.r-project.org/bin/linux/ubuntu/
    sudo apt-get install r-base-core
    sudo apt-get install r-base
    sudo apt-get install gdebi-core wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2021.09.1-372-amd64.deb
    sudo gdebi rstudio-server-2021.09.1-372-amd64.deb

    # download devtools
    sudo apt-get -y install libcurl4-openssl-dev
    sudo apt-get install libcurl4-openssl-dev libssl-dev
}

function install_devicons {
    # Install icons and put it in .local/share/fonts
    # IN terminal, set custom font as downloaded font
    # See: Ubuntu terminal preferences
}

# function install_font {
#     sudo apt-get install fonts-powerline
#     fc-cahce -vf
# }

function install_apps {
    sudo snap install youtube-music-desktop-app
}


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
    for f in $
	(ls ~/dotfiles/.vim/init); do
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
