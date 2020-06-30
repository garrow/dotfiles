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
  __reset_iterm_tab
  __reset_iterm_jobname
}
