# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

### Butterfingers
alias cd..='cd ..'
alias xx='cd ..'
alias q=l
alias rm='rm -i'

### Grep
alias pgrep='grep --color=never'  # Pipe grep

# Ack
alias k='ack'

alias isod='date +%Y.%m.%d.%R'
alias tod='date +%H:%M:%S'

### Misc tools
alias v=mvim
alias rld="source ~/.bashrc"
alias dotfiles="cd ~/.dotfiles/"
alias cwd="pwd | tr -d '\n' | pbcopy"
alias dud="du -hcd 1"
alias pyserve="python -m SimpleHTTPServer 8000"

########## Python ##########
alias p=python
