#!/usr/bin/env bash

function main() {
  local base_dir="${HOME}/projects/code"
  local repo_dir="${base_dir}/phoenix-configurations"
  local config_file="${HOME}/.phoenix.js"

  start_task $base_dir
  mkdir -p $base_dir
  end_task

  start_task "Repo"
  if [ ! -d $repo_dir ]; then
    print_info "... cloning"
    cd $base_dir
    git clone git@github.com:garrow/phoenix-configurations.git $repo_dir
    end_task
  else
    skip_task
  fi

  cd $repo_dir
  print_info "Git Log"
  git log -n 3 --pretty="format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s"
  print_info "Git Status"
  git status --porcelain

  start_task "Symlink"
  if [ -L "${config_file}" ]; then
    skip_task
  else
    print_warning "missing, creating now"

    start_task "Kill phoenix"
    ps axo pid,command | grep "[P]hoenix" |cut -f 1 -d' ' | xargs kill -15
    end_task

    start_task "Symlink: ${config_file}"
    ln -sF "${repo_dir}/phizeup/phizeup.js" "${config_file}"
    end_task
  fi

  start_task "Start Phoenix"
  open "/Applications/Phoenix.app"
  end_task
  print_success "Done"
  echo
}

start_task() {
  printf "🚧 $(tput setaf 8)[%s]$(tput sgr0) %s ... " "$(date +%H:%M:%S)" "$@"
}

end_task() {
  printf "✅ \n"
}

skip_task() {
  printf "☑️ \n"
}

print_warning() {
  echo "⚠️  $(tput bold)$(tput setaf 3)$@$(tput sgr0) ⚠️ "
}

print_info() {
  echo "$(tput bold)$(tput setaf 4)$@$(tput sgr0)"
}

print_success() {
  printf "\n$(tput bold)$(tput setaf 2)%s$(tput sgr0)" "$@"
}

main
