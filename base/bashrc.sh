# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
  
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi



# Attempt to force Java apps to support xmonad.
export _JAVA_AWT_WM_NONREPARENTING=1

# RVM
# Only automatically load when a new terminal is loaded where an rvmrc exists,
# Otherwise use the `load_rvm` alias to manually load for the current shell.
if [[ -f "${PWD}/.rvmrc" ]] && [[ -s "${HOME}/.rvm/scripts/rvm" ]]; then
    source "${HOME}/.rvm/scripts/rvm"
fi

export LESS="-FRX"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

sourceables=( aliases functions prompt git_bash_completion )

for element in "${sourceables[@]}"
do
    element_path="${base_env_path}/${element}.sh"
    if [[ -f $element_path ]]; then
        source $element_path
    else
        echo "Error loading sourceable component at ${element_path}, file does not exist."
    fi
done

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

complete -o bashdefault -o default -o nospace -F _git g


#### FASD
#fasd_cache="$HOME/.fasd-init-bash"
#if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
#fi
#source "$fasd_cache"
#unset fasd_cache


## Rake completion attempts - disabled for the moment for speed.
# _rake_completions()
# {
#     local curw
#     COMPREPLY=()
#     curw=${COMP_WORDS[COMP_CWORD]}
#     COMPREPLY=(compgen -W '$(rake -s -T | cut -d " " -f 2 | cut -d "[" -f 1)')
#     return 0
# }
#complete -F _rake_completions rake
#complete -C /home/garrowb/bin/rake-complete -o default rake
#compgen -W $(rake -s -T | cut -d " " -f 2 | cut -d "[" -f 1)

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
