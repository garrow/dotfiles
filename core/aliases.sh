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


### Grep
alias pgrep='grep --color=never'  # Pipe grep

alias isod='date +%Y.%m.%d.%R'
alias tod='date +%H:%M:%S'

### Misc tools
alias v=vim
alias rld="source ~/.bashrc"
alias cwd="pwd | tr -d '\n' | pbcopy"
alias dud="du -hcd 1"

####### Rails ########
alias rprod='export RAILS_ENV=production && renv'
alias rtest='export RAILS_ENV=test && renv'
alias rdev='export RAILS_ENV=development && renv'
alias rstage='export RAILS_ENV=staging && renv'
alias renv='echo $RAILS_ENV'
alias rdefault='unset RAILS_ENV'

######## Ruby ########
alias spec="time rspec"
alias be="bundle exec"


########## Python ##########
alias p=python
