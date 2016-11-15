alias rprod='export RAILS_ENV=production && renv'
alias rtest='export RAILS_ENV=test && renv'
alias rdev='export RAILS_ENV=development && renv'
alias rstage='export RAILS_ENV=staging && renv'
alias renv='echo $RAILS_ENV'
alias rdefault='unset RAILS_ENV'
alias rails='bundle exec rails'
alias r=rails

alias rs=__rails_server_with_port
alias rd='rails dbconsole'
alias rc='rails console'


function __rails_server_with_port
{
  local port=${RACK_PORT:-3000}

  echo "Booting Rails Server using PORT=${port}"
  set -x
  bundle exec rails server --port=$port
  set +x
}
