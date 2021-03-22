#!/bin/bash
# shellcheck disable=SC1090
# SC1090 - Ignore non-constant source/imports

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=erasedups

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

load_shell_dependencies_from_directory "shared:core"    "${base_dotfiles_path}/shared/core"
load_shell_dependencies_from_directory "shared:plugins" "${base_dotfiles_path}/shared/plugins"
load_shell_dependencies_from_directory "bash:plugins"   "${bash_bash_env_path}/plugins"
load_shell_dependencies_from_directory "bash:core"      "${bash_bash_env_path}/core"

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
