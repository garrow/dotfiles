#!/bin/bash
# shellcheck disable=SC1090
# SC1090 - Ignore non-constant source/imports

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=erasedups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Ignore SVN directories for the purpose of tab completion.
export FIGNORE=.svn

export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
export LS_COLORS=$LSCOLORS

export TERM=xterm-256color

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export LESS="-FRX"
distro_env_path="${base_env_path:?}/distros/${distro:?}"
source "${distro_env_path}/bashrc.sh"

# Load all main sourceables
sourceables=( aliases functions prompt )

for element in "${sourceables[@]}"
do
    core_element_path="${base_env_path}/core/${element}.sh"
    source "$core_element_path"
    custom_element_path="${distro_env_path}/${element}.sh"
    if [[ -f $custom_element_path ]]; then
        source "$custom_element_path"
    else
	      debug_dotfiles "No file to load: ${custom_element_path}"
    fi
done

for plugin_file in $(find "${base_env_path}/plugins" -name '*.sh' -type f)
do
    debug_dotfiles "$plugin_file"
    source "$plugin_file"
done

for vendor_file in $(find "${base_env_path}/vendor" -name '*.sh' -type f)
do
    debug_dotfiles "$vendor_file"
    source "$vendor_file"
done

dropbox_extras="${HOME}/Dropbox/.bash_extras.rc.sh"
if [ -f ${dropbox_extras} ]; then
  source "${dropbox_extras}"
fi

source "${HOME}/.extras.rc.sh"

PATH="${HOME}/bin:/usr/local/bin:$PATH"
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    # shellcheck disable=SC1091
    source /etc/bash_completion
fi

complete -o bashdefault -o default -o nospace -F _git g
# Only show directories when autocompleting for `cd`
complete -d cd
