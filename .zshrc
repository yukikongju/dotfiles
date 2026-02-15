# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
# zsh-autocomplete # https://github.com/marlonrichert/zsh-autocomplete
# zsh-syntax-highlighting
virtualenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ensure shell hook is installed to use "direnv allow" effectively
eval "$(direnv hook zsh)"

# OH-My-POSH SETUP
# themes: https://ohmyposh.dev/docs/themes
OHMYPOSH_THEME="amro"
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/${OHMYPOSH_THEME}.omp.json)"

# FIXME: show venv 
# oh-my-posh config export --config amro --output test.json
# oh-my-posh init your-shell --config path/to/your-theme.omp.json | Invoke-Expression
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

# ---- GIT ALIASES ----

#* CLI Aliases
alias gs="git status"
alias gc="git commit -m"
alias gcnv="git commit --no-verify -m"
alias gco="git checkout"


# ---- DIRECTORY NAVIGATION ----

##* Directoy Navigation
alias home="cd ~ && ls"
alias wiki="cd $HOME/Projects/VimWikiNotes/"

# Navigating to WorkAdhoc Directory
wadhoc() { 
    # Usage
    # wadhoc → current month
    # wadhoc -1 → last month
    # wadhoc +1 → next month
    # wadhoc -3 → 3 months ago

    local offset year month dir_path
    if [[ $# -eq 0 ]]; then
        # Base month (no offset logic at all)
        year=$(date +%Y)
        month=$(date +%m-%b-%Y | tr '[:lower:]' '[:upper:]')
    else
        offset=$1

        # Validate offset
        if [[ ! "$offset" =~ ^[+-]?[0-9]+$ ]]; then
            echo "Invalid offset: '$offset'"
            echo "Usage: wadhoc [±N]"
            return 1
        fi

        # macOS (BSD date)
        year=$(date -v"${offset}"m +%Y)
        month=$(date -v"${offset}"m +%m-%b-%Y | tr '[:lower:]' '[:upper:]')

	# linux
	# year=$(date -d "$offset month" +%Y)
	# month=$(date -d "$offset month" +%m-%b-%Y | tr '[:lower:]' '[:upper:]')
    fi

    dir_path="$HOME/Projects/VimWikiNotes/WorkAdHoc/$year/$month"

    if [[ ! -d "$dir_path" ]]; then
	echo "Directory does not exist, creating it"
	mkdir -p "$dir_path"
    fi

    echo "Switching to $dir_path"
    cd "$dir_path" || return 1

}

padhoc() { 
    # Usage
    # padhoc → current month
    # padhoc -1 → last month
    # padhoc +1 → next month
    # padhoc -3 → 3 months ago

    local offset year month dir_path
    if [[ $# -eq 0 ]]; then
        # Base month (no offset logic at all)
        year=$(date +%Y)
        month=$(date +%m-%b-%Y | tr '[:lower:]' '[:upper:]')
    else
        offset=$1

        # Validate offset
        if [[ ! "$offset" =~ ^[+-]?[0-9]+$ ]]; then
            echo "Invalid offset: '$offset'"
            echo "Usage: wadhoc [±N]"
            return 1
        fi

        # macOS (BSD date)
        year=$(date -v"${offset}"m +%Y)
        month=$(date -v"${offset}"m +%m-%b-%Y | tr '[:lower:]' '[:upper:]')

	# linux
	# year=$(date -d "$offset month" +%Y)
	# month=$(date -d "$offset month" +%m-%b-%Y | tr '[:lower:]' '[:upper:]')
    fi

    dir_path="$HOME/Projects/VimWikiNotes/PersonalAdHoc/$year/$month"

    if [[ ! -d "$dir_path" ]]; then
	echo "Directory does not exist, creating it"
	mkdir -p "$dir_path"
    fi

    echo "Switching to $dir_path"
    cd "$dir_path" || return 1

}


# ---- CURRENT PROJECT SHORTCUT ----

##* PERSONNAL
alias carseg="cd $HOME/Projects/Miscellaneous-Projects/CarSegmentation && code ."
alias sigproc="cd $HOME/Projects/Miscellaneous-Projects/sigproc"
alias rwalk="cd $HOME/Projects/Miscellaneous-Projects/RandomWalk"
alias tidytuesday='
cd $HOME/Projects/tidytuesday/ && \
tmux split-window -v "uv run python -m notebook" && \
tmux select-pane -U && \
tmux split-window -v "vi $HOME/Projects/tidytuesday/README.md"
'

# TODO: open arc link with learning

##* LEARNING
alias spatial='
cd "$HOME/Projects/Miscellaneous-Projects/SpatialThoughts" && \
tmux split-window -v "uv run python -m notebook" && \
tmux select-pane -U && \
tmux split-window -v "vi $HOME/Projects/VimWikiNotes/WhatIveLearned/diary/2026-01-29.md"
'
alias radioref='vi $HOME/Projects/VimWikiNotes/WhatIveLearned/diary/2026-01-24.md'
alias econ='vi $HOME/Projects/VimWikiNotes/WhatIveLearned/diary/2026-01-30.md'
alias silge='vi $HOME/Projects/VimWikiNotes/WhatIveLearned/diary/2026-01-20.md'

alias deepml="cd $HOME/Projects/LeetCodeTraining/DeepML/" # TODO: open deeml link
alias lean="cd $HOME/Projects/LeetCodeTraining/Lean/" # TODO: open lean link
alias wil='
cd $HOME/Projects/VimWikiNotes/WhatIveLearned/
vi diary/diary.md
'

##* SCHOOL
alias mila="cd $HOME/Projects/MilaCourse/IFT6765/" # TODO: open course link
alias vqa="cd $HOME/Projects/MilaCourse/IFT6765/paper-presentations/vqa/"
alias papers="cd $HOME/Projects/MilaCourse/IFT6765/papers/"
alias cert="cd $HOME/Projects/satellite/certifications/CanadianBasicQualification/"

##* WORK
alias scoping="cd $HOME/Projects/Miscellaneous-Projects/ExperimentsScopingCalculator && streamlit run gui.py"
alias inges="cd $HOME/Documents/ds-ingestion/"
# Note: if "code" doesn't work, then `Ctrl+Shift+P` and Select the command Shell Command: Install 'code' command in PATH
alias dash="cd $HOME/Documents/dashboards && code ."
alias organics="cd $HOME/Projects/Miscellaneous-Projects/OrganicSubstractionModel/ && tmux split-window -v && uv run python3 -m notebook"

##* UTILS
alias snips="cd $HOME/dotfiles/.vim/UltiSnips/"
alias wiggler="cd $HOME/Projects/Miscellaneous-Projects/MouseWiggler && python3 wiggler.py 100 3"


# ---- ENVIRONMENT VARIABLES ----

export MYVIMRC="$HOME/.vimrc"
export MYZSHRC="$HOME/.zshrc"
export MYTMUXCONF="$HOME/.tmux.conf"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Python/3.10/bin:$PATH"
export PATH="(python3 -m site --user-base)/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/emulie/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/emulie/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/emulie/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/emulie/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
source ~/Downloads/google-cloud-sdk/completion.zsh.inc


export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@3
