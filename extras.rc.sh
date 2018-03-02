#!/bin/bash
alias extras="mvim ~/.extras.rc.sh"

alias bgop="cd /Users/garrow/Dropbox/work/code/bgop"
alias pico8="cd /Users/garrow/Dropbox/Projects/code/pico8"
alias ksr="cd /Users/garrow/work/code/kickstarter"
alias wiki="cd /Users/garrow/work/code/wiki "


alias emulate_production='cp config/settings/production.yml config/settings/development.yml'

alias tdl='tail -f log/development.log'
alias ttl='tail -f log/test.log'
alias tpl='tail -f ~/Library/Logs/Pow/*.log'

alias deps="cd ~/.babushka/deps"
alias todo="vim ~/todo.txt"
alias mmod='gmod | spelunk'



# Obsoleted by brew services
alias stop_pg='pg_ctl stop -D /usr/local/var/postgres'

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
  local __git_current_branch=$(git rev-parse --abbrev-ref HEAD)

  git log --pretty="%s" -n 1 > ${pr_file}
  echo "Creating new PR for branch [ ${__git_current_branch} ]"
  git push --set-upstream origin ${__git_current_branch}
  cat $pr_file

  hub pull-request -F ${pr_file}
}



alias cleardevlog="cat /dev/null > log/development.log"
rt() {
  bin/spring rake test TEST=$1 TESTOPTS="--name=\"/$2/\""
}

alias twl="tail -f log/webpack.log"
function __browserpack
{
  # Yarn's website color
  __set_iterm_tab_color 33 136 182
  __set_iterm_jobname "webpack📦"
  ksr
  cd browser && yarn start
  ksr
  __reset_iterm_tab
  __reset_iterm_jobname
}

function __yarn_test
{
  #__set_iterm_tab_color 33 136 182
  __set_iterm_tab_color 128 244 66
  __set_iterm_jobname "yarn✅❌"
  ksr
  cd browser && yarn test
  ksr
  __reset_iterm_tab
  __reset_iterm_jobname
}

function __sidekiq
{
  __set_iterm_tab_color 177 0 62
  __set_iterm_jobname "sidekiq"
  ksr
  bin/sidekiq
  __reset_iterm_tab
  __reset_iterm_jobname
}

alias kdb=__kickstarter_dev_database

function __kickstarter_dev_database
{
  __set_iterm_tab_color 242 145 17
  __set_iterm_jobname 'mysql'
  mysql ksr_dev
  __reset_iterm_tab
  __reset_iterm_jobname
}
