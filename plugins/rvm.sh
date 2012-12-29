# RVM
# Only automatically load when a new terminal is loaded where an rvmrc exists,
# Otherwise use the `load_rvm` alias to manually load for the current shell.
if [[ -f "${PWD}/.rvmrc" ]] && [[ -s "${HOME}/.rvm/scripts/rvm" ]]; then
    source "${HOME}/.rvm/scripts/rvm"
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias load_rvm='source "${HOME}/.rvm/scripts/rvm"'
