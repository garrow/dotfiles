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



export LESS="-FRX"

# Load all main sourceables
sourceables=( aliases functions prompt git_bash_completion )

for element in "${sourceables[@]}"
do
    core_element_path="${base_env_path}/core/${element}.sh"
    source $core_element_path
    custom_element_path="${base_env_path}/${distro}/${element}.sh"
    if [[ -f $custom_element_path ]]; then
        source $custom_element_path
    else
	if [ $DEBUG_DOTFILES == 'true' ]; then
        	echo "Error loading: ${custom_element_path}"
        fi
    fi
done

for plugin_file in `find ${base_env_path}/plugins -type f`
do
    echo $plugin_file
    source $plugin_file
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
