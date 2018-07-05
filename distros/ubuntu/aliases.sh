#!/bin/bash
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

### Misc tools
alias go='gnome-open'
alias shot="gnome-screenshot --interactive"
alias ack='ack-grep'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    if test -r ~/.dircolors; then
      eval "$(dircolors -b ~/.dircolors)"
    else
      eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# -l long-listing-format
alias ls_custom='ls -l --human-readable --file-type'
alias l='ls_custom --no-group' # Simple format
alias ll='l --almost-all'      # Include hidden files
alias la='ls_custom --all'     # Include everything
