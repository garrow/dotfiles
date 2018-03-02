#!/bin/bash
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

alias rs=__rails_server_with_port
function __rails_server_with_port
{
  local port=${RACK_PORT:-3000}

  echo "Booting Rails Server using RACK_PORT=${port}"
  __set_iterm_tab_color 132 27 45
  __set_iterm_jobname "🚂 🚃:$port"
  bundle exec rails server --port="$port"
  __reset_iterm_tab
  __reset_iterm_jobname
}
