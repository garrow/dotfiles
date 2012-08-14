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

# Grep 
alias pgrep='grep --color=never'  # Pipe grep

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias isod='date +%Y.%m.%d.%R'
alias tod='date +%H:%M:%S'

alias rb="rhythmbox-client"
alias ack='ack-grep'

# Some more ls aliases
alias l='ls -Chl --file-type'
alias ll='ls -lah --file-type'
alias la='ll -A'

alias go='gnome-open'
alias v=vim
alias shot="gnome-screenshot --interactive"

alias rld="source ~/.bashrc"

##### GIT ######
alias g=git
alias gs='git status $1'
alias gsl='git-smart-log'
alias gd='git diff'
alias gds='git diff --color --staged '
alias gap='git add --patch'

####### SVN ######
alias sd='svndiff'
alias ss='svn status $* | svnstat.rb'
alias ssq='svn status -q $* | svnstat.rb'
alias si="svn info"
alias sup='svn update --ignore-externals'
alias supall='svn update'
alias slc='svn log --stop-on-copy'
alias sbs='si|grep URL;slc -v'
#alias rake_completion='compgen -W $(rake -s -T | cut -d " " -f 2 | cut -d "[" -f 1)'
alias cbranch="svn info |grep URL | cut -d '/' -f6"

####### Rails ########
alias rprod='export RAILS_ENV=production && renv'
alias rtest='export RAILS_ENV=test && renv'
alias rdev='export RAILS_ENV=development && renv'
alias rstage='export RAILS_ENV=staging && renv'
alias renv='echo $RAILS_ENV'
alias rdefault='unset RAILS_ENV'


alias spec="time rspec"
