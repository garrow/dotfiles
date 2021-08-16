_rake () {
  if [ -f Rakefile ]; then
    if [[ ! -f .rake_tasks || Rakefile -nt .rake_tasks ]]; then
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd $(cat .rake_tasks)
  fi
}

compdef _rake rake

alias rt=__rake_test_file
function __rake_test_file()
{
  __set_iterm_tab_color 128 244 66
  __set_iterm_jobname 'rake test'
  bundle exec rake test TEST=$1 TESTOPTS="--name=\"/$2/\""
  __reset_iterm_defaults
}
