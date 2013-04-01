# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
export LS_COLORS=$LSCOLORS
export color_prompt="yes"

#check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export LESS="-FRX"
distro_env_path=${base_env_path}/distros/${distro}
source ${distro_env_path}/bashrc.sh

# Load all main sourceables
sourceables=( aliases functions prompt git_bash_completion )

for element in "${sourceables[@]}"
do
    core_element_path="${base_env_path}/core/${element}.sh"
    source $core_element_path
    custom_element_path="${distro_env_path}/${element}.sh"
    if [[ -f $custom_element_path ]]; then
        source $custom_element_path
    else
	if [ $DEBUG_DOTFILES == 'true' ]; then
        	echo "Error loading: ${custom_element_path}"
        fi
    fi
done

for plugin_file in `find ${base_env_path}/plugins -name '*.sh' -type f`
do
    echo $plugin_file
    source $plugin_file
done

source ~/.extras.rc.sh

PATH="~/bin/:$PATH"
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

complete -o bashdefault -o default -o nospace -F _git g


