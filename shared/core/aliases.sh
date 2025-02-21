
# ls config
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias ls_custom="ls -ho --color" # h=Human readable, o=long format, sans group ID
alias l="ls_custom"      # Sort by filename (default)
alias lr="ls_custom -t"  # Sort by recent
alias ll="ls_custom -a"  # Everything

alias md5sum='md5 -r'
alias o="open"

alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'


# echo "aliases"
### Butterfingers
alias cd..='cd ..'
alias xx='cd ..'
alias qq=l
alias del='rm -i'

### Grep
alias pgrep='grep --color=never'  # Pipe grep
alias recall='history | grep'
alias cg=pcre2grep

# Ack/Ag
alias k='ag'
alias af='ag -g'

alias isod='date +%Y.%m.%d.%R'
alias isof='date +%Y%m%d%H%M'
alias timetag='date +%Y%m%d%H%M%S'
alias datestamp='date +%Y-%m-%d_%H%M'
alias tod='date +%H:%M:%S'

alias newest='ls -t | head -n1'

### Misc tools
alias v=vim
alias rld="source ${ZDOTDIR}/.zshrc"
alias cwd="pwd | tr -d '\\n' | pbcopy"
alias dud="du -hcd 1"
alias pyserve="python3 -m http.server -d "

########## Python ##########
alias p=python


## Shortcuts
alias typora='open -a Typora.app'
alias dotfiles="cd ~/.dotfiles/"

alias chmox='chmod +x'

alias autoprune=__git_prune_automagic

alias macos_reset_dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# List all paths, one to a line
alias paths='echo $PATH | tr ":" "\n"'

# fzf to vim
# https://github.com/junegunn/fzf#age
#functio
#alias fv='fzf --print0 | xargs -0 -o vim'

function fv()
{
  local query="$@"

  fzf --print0 --query="${query}" | xargs -0 -o vim
}
