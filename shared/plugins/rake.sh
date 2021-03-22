_rake () {
  if [ -f Rakefile ]; then
    if [[ ! -f .rake_tasks || Rakefile -nt .rake_tasks ]]; then
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd $(cat .rake_tasks)
  fi
}

compdef _rake rake
