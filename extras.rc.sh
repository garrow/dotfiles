# Open piped files in IDEA, adjunct to `spelunk`
alias ideas='only_files | xargs idea'

alias xgrm="xargs git rm"
alias extras="mvim ~/.extras.rc.sh"

alias r2d="cd /Users/garrow/Dropbox/Projects/code/ruby2d"
alias projects="cd /Users/garrow/projects"
alias j=jira


alias todo="vim ~/todo.txt"
alias mmod='gmod | spelunk'

alias findd='find . -type d |grep -i'

#alias cut_release='git merge master --ff-only && git tag `date +v%Y-%m-%d-T%H%M%S%z`'

alias clip64='pbpaste | base64 | pbcopy'

alias dockerstats='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}"'

export PATH="$PATH:/Users/garrow/node_modules/.bin"


function __find_process()
{
  local search_term=$1
  ps aux | grep "${search_term}" | grep -v "grep"
}
alias psaux=__find_process

export AWS_REGION=us-east-1



