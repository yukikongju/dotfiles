sudo chown -R $(whoami) $(brew --prefix)/*
brew install tmux
# brew install vim
brew install --build-from-source vim
echo "set completion-ignore-case on" > ~/.inputrc



