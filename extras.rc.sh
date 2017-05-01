alias extras="vim ~/.extras.rc.sh"


alias maven=mvn
alias bgop="cd /Users/garrow/Dropbox/work/code/bgop"

alias emulate_production='cp config/settings/production.yml config/settings/development.yml'

alias tdl='tail -f log/development.log'

alias deps="cd ~/.babushka/deps"
alias todo="vim ~/todo.txt"
alias mmod='gmod | spelunk'

# Obsoleted by brew services
alias stop_pg='pg_ctl stop -D /usr/local/var/postgres'


alias fame="cd ~/fame/"
alias fw="cd ~/fame/website"
alias fdb="psql fame_website_development"
alias reset_fame_database="pg_restore -d fame_website_development --clean ~/fame/data/database_backups/development/fame_website_development_clean.pgdump"

alias findd='find . -type d |grep -i'

alias cop='git checkout stable'
alias cut_release='git merge master --ff-only && git tag `date +v%Y-%m-%d-T%H%M%S%z`'

alias clip64='pbpaste | base64 | pbcopy'


alias hstart="/usr/local/Cellar/hadoop/2.7.2/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.7.2/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.7.2/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.7.2/sbin/stop-dfs.sh"


function rt() {
bundle exec rake test TEST="${1}"
}



function quick_pr(){
  local pr_file=$(mktemp -t NEW_PR)
  local current_branch=$(git rev-parse --abbrev-ref HEAD)

  git log --pretty="%s" -n 1 > ${pr_file}
  echo "Creating new PR for branch [ ${current_branch} ]"
  cat $pr_file

  hub pull-request -F ${pr_file}

}
