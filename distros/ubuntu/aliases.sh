
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

### Misc tools
alias go='gnome-open'
alias shot="gnome-screenshot --interactive"
alias ack='ack-grep'

# -l long-listing-format
alias ls_custom='ls -l --human-readable --file-type'
alias l='ls_custom --no-group' # Simple format
alias ll='l --almost-all'      # Include hidden files
alias la='ls_custom --all'     # Include everything

