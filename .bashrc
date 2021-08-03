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
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set the prompt.
function bash_prompt(){
    # PS1='${debian_chroot:+($debian_chroot)} '${blu}'\w '${red}'$(git_branch)'${grn}' \$ '${clr}
    PS1=''${grn}'$(whoami) '${wht}'in ${debian_chroot:+($debian_chroot)}'${blu}'\w '${red}'$(git_branch)'${grn}'\$ '${clr}
    # PS1='${debian_chroot:+($debian_chroot)} '${cyn}'\w '${pur}'$(git_branch)'${grn}' \$ '${clr}
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


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# add fzf autocomplete for terminal
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPS="--extended"
# export FZF_DEFAULT_COMMAND="fd --type f"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

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
	touch .gitignore LICENSE requirements.txt;

	# generate README.md
	generate_readme

	# generate LICENCE

	# generate .vimspector.json file for debugger
	generate_vimspector_python_json

	# open README.md after creating project
	vi README.md
    fi
}

# TO FIX: indentation doesn't work
# VIMSPECTOR_CONTENT=$(cat <<-END
    # {
        # "configurations": {
            # "run Python":{
                # "adapter" : "debugpy",
                # "configuration" :{
                # "request": "launch",
                # "type":"python",
                # "protocol": "auto",
                # "stopOnEntry": true,
                # "cwd":"~$(pwd)",
                # "program": "*.py",
                # "debugOptions":[]
		# }
	    # }
	# }
    # }
# END
# )

function generate_vimspector_python_json() {
    touch .vimspector.json
    dir=$(basename $PWD)
    printf '{\n' >> .vimspector.json
    printf '\t"configurations": {\n' >> .vimspector.json
    printf '\t\t"run Python":{\n' >> .vimspector.json
    printf '\t\t\t"adapter" : "debugpy",\n' >> .vimspector.json
    printf '\t\t\t"configuration" :{\n' >> .vimspector.json
    printf '\t\t\t"request": "launch",\n' >> .vimspector.json
    printf '\t\t\t"type":"python",\n' >> .vimspector.json
    printf '\t\t\t"protocol": "auto",\n' >> .vimspector.json
    printf '\t\t\t"stopOnEntry": true,\n' >> .vimspector.json
    printf '\t\t\t"cwd":"~/%s",\n' $dir >> .vimspector.json
    printf '\t\t\t"program": "main.py",\n' >> .vimspector.json
    printf '\t\t\t"debugOptions":[]\n' >> .vimspector.json
    printf '\t\t\t}\n' >> .vimspector.json
    printf '\t\t}\n' >> .vimspector.json
    printf '\t}\n' >> .vimspector.json
    printf '}\n' >> .vimspector.json
}


function generate_readme() {
    touch README.md
    echo "# $(basename $PWD) " >> README.md
    echo "" >> README.md

    # create table of contents in README.md
    echo "## Table of Contents" >> README.md
    echo "" >> README.md
    echo "- [Requirements](#requirements)" >> README.md
    echo "- [Features](#features)" >> README.md
    echo "- [How it Works](#how-it-works)" >> README.md
    echo "- [Usage](#usage)" >> README.md
    echo "- [Classes](#classes)" >> README.md
    echo "- [Ressources](#ressources)" >> README.md

    # create sections
    echo "" >> README.md
    echo -e "## [Requirements](#requirements)\n" >> README.md
    echo -e "#### Step 1: Create virtual environment with venv (suggested)\n" >> README.md
    venv_name=$(echo "$(basename $PWD)-venv" | awk '{print tolower($0)}')
    echo -e "\`\` python3 -m venv $venv_name \`\`\n" >> README.md
    echo -e "\`\` source "${venv_name}"/bin/activate \`\`\n" >> README.md
    echo -e "#### Step 2: Install Requirements\n" >> README.md
    echo -e "\`\` pip install --upgrade -r requirements.txt \`\` \n" >> README.md

    echo "" >> README.md
    echo "## [Features](#features)" >> README.md
    echo "## [How it Works](#how-it-works)" >> README.md
    echo "## [Usage](#usage)" >> README.md
    echo "## [Classes](#classes)" >> README.md
    echo "## [Ressources](#ressources)" >> README.md
}

