export PATH="$PATH:/c/Python38"


####################### ALIASES ###################################

alias py="winpty python.exe"

# git aliases
alias gs='git status'
alias ga='git add' # Add a file to Git.
alias gaa='git add --all' # Add all files to Git.
alias gc='git commit' # Commit changes to the code.
alias gl='git log --oneline' # View the Git log.
alias gd='git diff' # View the difference.
alias gb='git checkout -b' # Create a new Git branch and move to the new branch at the same time.

# months aliases
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

############## Bash History Parameters ######################

HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups
HISTSIZE=2000
HISTFILESIZE=2000

################## BASH COLORS ##################################

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

########################## CUSTOMIZATION ##########################

# Display the current Git branch in the Bash prompt.

function git_branch() {
    if [ -d .git  ] ; then
	printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Set the prompt.
function bash_prompt(){
    PS1='${debian_chroot:+($debian_chroot)}'${red}'$(git_branch)'${blu}' \W'${grn}' \$ '${clr}
}

bash_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

########################### FUNCTIONS ############################

# initialize new git project: git_init project_name

function git_init() {
    if [ -z "$1"  ]; then
	printf "%s\n" "Please provide a directory name.";
    else
	mkdir "$1";
	builtin cd "$1";
	pwd;
	git init;
	touch readme.md .gitignore LICENSE;
	echo "# $(basename $PWD)" >> readme.md
    fi
}
