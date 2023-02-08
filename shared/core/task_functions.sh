# Usage
#
# source "${base_dotfiles_path}/shared/core/task_functions.sh"



### Helpers
countdown(){
  local message="${1}"
  local down='🕒🕑🕐🕛'
  local timeout=2
  local t=0
  while [[ $t < $timeout ]];  do
    declare -i r=timeout-t
    printf "\e[160D\e[K${message} ${down:$t:1} $(tput setaf 8)00:%02d$(tput sgr 0)" "$r"
    (( t++ ))
    sleep 1
  done
  printf "\e[160D\e[K"
  # printf "\e[160D\e[K${message} ${down:$t:1} 👍\n"
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

abort_task() {
  printf "❌️ (abort) \n"
}

print_warning() {
  echo "⚠️  $(tput bold)$(tput setaf 3)$@$(tput sgr0) ⚠️ "
}

print_info() {
  echo "$(tput bold)$(tput setaf 4)$@$(tput sgr0)"
}


print_success() {
  printf "$(tput bold)$(tput setaf 2)%s$(tput sgr0)\n" "$@"
}

_demonstrate_task_functions() {
  start_task "Starting a task"
  end_task

  start_task "A skippable task"
  skip_task

  start_task "A task that shows some messages"

  print_info "Some info"
  echo
  print_success "Cool success!"
  echo
  print_warning "Shame about the warning"
  echo
  end_task
}