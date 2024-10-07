# Open piped files in IDEA, adjunct to `spelunk`
alias ideas='only_files | xargs idea'

alias xgrm="xargs git rm"
alias extras="vim ~/.extras.rc.sh"

alias pn=pnpm
# favdir r2d ${HOME}/Dropbox/Projects/code/ruby2d
favdir projects ${HOME}/projects

alias todo="vim ~/todo.txt"
alias mmod='gmod | spelunk'

alias findd='find . -type d |grep -i'

#alias cut_release='git merge master --ff-only && git tag `date +v%Y-%m-%d-T%H%M%S%z`'

alias clip64='pbpaste | base64 | pbcopy'

alias dockerstats='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}"'

path+=("${HOME}/node_modules/.bin")
#export PATH="$PATH:/Users/garrow/node_modules/.bin"

function __find_process() {
  local search_term=$1
  ps aux | grep "${search_term}" | grep -v "grep"
}
alias psaux=__find_process

export AWS_REGION=us-east-1

function __current_git_profile() {
  local author=$(git config --get user.email)
  if [[ "${author}" == "garrowb@spotify.com" ]] ; then
    echo "(git-work) $(__spotify_logo)"
  elif [[ "${author}" == 'garrow.bedrossian@gmail.com' ]]; then
    echo "(git-personal)"
  else
    echo "(git-author: ${author})"
  fi
}


export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools/
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
