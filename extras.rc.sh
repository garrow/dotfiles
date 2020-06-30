#!/bin/bash

alias rbcop=rubocop
alias xgrm="xargs git rm"
alias extras="mvim ~/.extras.rc.sh"
alias cg=pcre2grep
alias ksr="cd /Users/garrow/work/code/kickstarter"
alias rfc="cd /Users/garrow/work/code/rfcs"
alias smoke="cd /Users/garrow/work/code/drip-smoke"
alias wiki="cd /Users/garrow/work/code/wiki"
alias api="cd /Users/garrow/work/code/api-starter"
alias r2d="cd /Users/garrow/Dropbox/Projects/code/ruby2d"
alias projects="cd /Users/garrow/projects"
alias homepage="cd /Users/garrow/work/code/browser-home"
alias aoc="cd /Users/garrow/projects/advent2019"
alias j=jira

alias prview="gh pr view"

alias restart="touch tmp/restart.txt"

alias tdl='tail -f log/development.log'
alias ttl='tail -f log/test.log'

alias deps="cd ~/.babushka/deps"
alias todo="vim ~/todo.txt"
alias mmod='gmod | spelunk'

alias rubocop_change='gbc | grep rb | only_files | xargs rubocop'

alias findd='find . -type d |grep -i'

alias cut_release='git merge master --ff-only && git tag `date +v%Y-%m-%d-T%H%M%S%z`'

alias clip64='pbpaste | base64 | pbcopy'

function railst() {
bin/rails test TEST="$1" TESTOPTS="--name=\"/$2/\""
}

function rspec_24() {
RAILS_ENV=test RBENV_VERSION=2.4.1 bundle exec rspec $@
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
alias twl="tail -f log/webpack.log"

function __yarn_start
{
  # Yarn's website color
  __set_iterm_tab_color 33 136 182
  __set_iterm_jobname "webpack📦"
  ksr
  cd browser
  yarn start --maxWorkers 4
  ksr
  __reset_iterm_defaults
}

alias ys=__yarn_start
alias yt=__yarn_test

function __yarn_test
{
  #__set_iterm_tab_color 33 136 182
  __set_iterm_tab_color 128 244 66
  __set_iterm_jobname "yarn✅❌"
  ksr
  cd browser && yarn test  --maxWorkers 2 --no-coverage
  ksr
  __reset_iterm_defaults
}

function __sidekiq
{
  __set_iterm_tab_color 177 0 62
  __set_iterm_jobname "sidekiq"
  ksr
  bin/sidekiq -L log/sidekiq.log
  __reset_iterm_defaults
}

alias kdb=__kickstarter_dev_database

function __kickstarter_dev_database
{
  __set_iterm_tab_color 242 145 17
  __set_iterm_jobname 'mysql'
  mysql ksr_dev
  __reset_iterm_defaults
}

alias ktb=__kickstarter_test_database

function __kickstarter_test_database
{
  __set_iterm_tab_color 242 145 17
  __set_iterm_jobname 'mysql'
  mysql ksr_test
  __reset_iterm_defaults
}


alias dockerstats='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}"'
alias git_commit_wip='git commit --no-verify -m "WIPWIPWIPWIPWIPWIPWIPWIPWIPWIPWIP"'
alias gcwip=git_commit_wip


function __tail_development_log
{
  __set_iterm_tab_color 242 145 17
  __set_iterm_jobname 'devlog'
  tail -f log/development.log
  __reset_iterm_defaults
}

alias tdl=__tail_development_log

function __rails_console
{
  __set_iterm_tab_color 204 52 45
  __set_iterm_jobname 'rails console'
  bundle exec rails console
  __reset_iterm_defaults
}
alias rc=__rails_console


function __rake_test_file()
{
  __set_iterm_tab_color 128 244 66
  __set_iterm_jobname 'rake test'
  bundle exec rake test TEST=$1 TESTOPTS="--name=\"/$2/\""
  __reset_iterm_defaults
}

alias rt=__rake_test_file


function __rake_test_changes()
{
  __set_iterm_tab_color 128 244 66
  __set_iterm_jobname 'test changes'
  ./bin/test-changes
  __reset_iterm_defaults
}

alias rtc=__rake_test_changes

function __ksr_ssh_prod()
{
  __set_iterm_tab_color 244 244 66
  __set_iterm_jobname 'ksr PROD❗️'
  ksr
  bin/cap production console:sidekiq
  __reset_iterm_defaults
}

function __rosie_ssh_prod()
{
  __set_iterm_tab_color 244 244 66
  __set_iterm_jobname 'ROSIE PROD❗️'
  rosie
  cap production ssh:bg
  __reset_iterm_defaults
}


function __ksr_ssh_staging()
{
  __set_iterm_tab_color 200 128 244
  __set_iterm_jobname 'ksr staging❗️'
  ksr
  bin/cap staging ssh:sidekiq
  __reset_iterm_defaults
}


function type_gen()
{
  __set_iterm_tab_color 0 138 110
  __set_iterm_jobname 'yarn graphql-type-gen'
  ksr
  yarn graphql-type-gen
  __reset_iterm_defaults
}

alias prod=__ksr_ssh_prod
alias staging=__ksr_ssh_staging

export PATH="$PATH:/Users/garrow/node_modules/.bin"


function __find_process()
{
  local search_term=$1
  ps aux | grep "${search_term}" | grep -v "grep"
}
alias psaux=__find_process
export AWS_REGION=us-east-1

function __AppleInterfaceStyle {
  local ais=$(defaults read -g AppleInterfaceStyle 2>/dev/null| tr '[:upper:]' '[:lower:]')

  ais=${ais:-light}
  echo $ais
}

export AppleInterfaceStyle=$(__AppleInterfaceStyle)
