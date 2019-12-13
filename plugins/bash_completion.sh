#!/bin/bash

# Relies on homebrew bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"


## Load bash completion, using a prefix if homebrew exists.
#prefix=""
#if command -v brew > /dev/null ; then
# prefix=$(brew --prefix)
#fi
#
#if [ -f "${prefix}/etc/bash_completion" ]; then
#  # shellcheck source=/dev/null
#  source "$prefix/etc/bash_completion"
#else
#  debug_dotfiles "No bash completion available"
#fi
