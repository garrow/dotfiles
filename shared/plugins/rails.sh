alias rprod='export RAILS_ENV=production && renv'
alias rtest='export RAILS_ENV=test && renv'
alias rdev='export RAILS_ENV=development && renv'
alias rstage='export RAILS_ENV=staging && renv'
alias renv='echo $RAILS_ENV'
alias rdefault='unset RAILS_ENV'
alias rails='bundle exec rails'
alias r=rails

alias rd='rails dbconsole'
alias rc='rails console'
alias restart="touch tmp/restart.txt"


alias tdl='tail -f log/development.log'
alias ttl='tail -f log/test.log'
alias cleardevlog="cat /dev/null > log/development.log"

alias rs=__rails_server_with_port
function __rails_server_with_port
{
  local port=${RACK_PORT:-6000}

  echo "Booting Rails Server using RACK_PORT=${port}"
  __set_iterm_tab_color 132 27 45
  __set_iterm_jobname "🚂 🚃:$port"
  bundle exec rails server --port="$port"
  __reset_iterm_tab
  __reset_iterm_jobname
}

alias rc=__rails_console
function __rails_console
{
  __set_iterm_tab_color 204 52 45
  __set_iterm_jobname 'rails console'
  bundle exec rails console
  __reset_iterm_defaults
}

function __tail_development_log
{
  __set_iterm_tab_color 242 145 17
  __set_iterm_jobname 'devlog'
  tail -f log/development.log
  __reset_iterm_defaults
}

alias tdl=__tail_development_log

function railst() {
  bin/rails test TEST="$1" TESTOPTS="--name=\"/$2/\""
}