# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

function pyenv()
{
if [[ ( $1 == "list" ) || ( $1 == "show" ) ]]; then
	 ls ~/.venvs
	 return
fi
	if [[ ! -d ~/.venvs/$1 ]]; then
		echo "createing new Virtual Environment $1"
		python3 -m venv ~/.venvs/$1
	fi
	echo "using Virtual Environment $1"
	source ~/.venvs/$1/bin/activate
}

function _listlists()
{
    local cur
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($( compgen -W "$(ls ~/.venvs )" -- $cur ) )

}

complete -F _listlists pyenv

git_branch() {
    (which git &>/dev/null && git branch 2>/dev/null || echo) \
    | grep '^*' \
    | awk '{$1=""; print substr($0, 2)}'
}

python_virtualenv() {
    basename "${VIRTUAL_ENV:-}"
}
set_ps1() {
     local exit="$?"  # grab before executing other code

     # local black="\[$(tput setaf 0)\]"
     local red="\[$(tput setaf 1)\]"
     # local green="\[$(tput setaf 2)\]"
     # local yellow="\[$(tput setaf 3)\]"
     # local blue="\[$(tput setaf 4)\]"
     # local purple="\[$(tput setaf 5)\]"
     local turquoise="\[$(tput setaf 6)\]"
     local dim_white="\[$(tput dim)$(tput setaf 7)\]"
     # local white="\[$(tput setaf 7)\]"
     local reset="\[$(tput sgr0)\]"

     PS1="[${turquoise}\\u${reset}@${turquoise}\\h${reset}:${turquoise}\\W${reset}]"
     if [ "${exit}" != 0 ]; then
         PS1+="[${red}"
         PS1+='rc:$?'
         PS1+="${reset}]"
     fi
     if [ -n "$(git_branch)" ]; then
         PS1+="[${dim_white}"
         PS1+='branch:$(git_branch)'
         PS1+="${reset}]"
     fi
     if [ -n "$(python_virtualenv)" ]; then
         PS1+="[${dim_white}"
         PS1+='venv:$(python_virtualenv)'
         PS1+="${reset}]"
     fi
     PS1+='
 $ '
 }
 PROMPT_COMMAND=set_ps1
 # Allow forward search scroll using ctrl+s
 stty -ixon
