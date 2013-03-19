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


##### GIT ######
alias g=git
alias gs='git status'
alias gse='git status --ignored'
alias gsl='git log --pretty="format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s" --graph'
alias gr='gsl -n 10'
alias gra='gr --all'
alias gd='git diff'
alias gds='git diff --color --staged '
alias gap='git add --patch'
alias grp='git reset --patch'
alias gcp='git checkout --patch'
alias gvp=gcp


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

######## Ruby ########
alias spec="time rspec"
alias be="bundle exec"


########## Python ##########
alias p=python
