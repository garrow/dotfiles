### Butterfingers
alias cd..='cd ..'
alias xx='cd ..'
alias qq=l
alias del='rm -i'

### Grep
alias pgrep='grep --color=never'  # Pipe grep

alias recall='history | grep'

# Ack
alias k='ag'
alias af='ag -g'

alias isod='date +%Y.%m.%d.%R'
alias isof='date +%Y%m%d%H%M'
alias timetag='date +%Y%m%d%H%M%S'
alias tod='date +%H:%M:%S'

alias newest='ls -t | head -n1'

### Misc tools
alias v=vim
alias rld="source ~/.bash_profile"
alias cwd="pwd | tr -d '\\n' | pbcopy"
alias dud="du -hcd 1"
alias pyserve="python -m SimpleHTTPServer 8000"


########## Python ##########
alias p=python


## Shortcuts
alias dotfiles="cd ~/.dotfiles/"
alias deps="cd ~/.babushka/deps"
