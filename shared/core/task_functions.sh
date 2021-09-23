# Usage
#
# source "${base_dotfiles_path}/shared/core/task_functions.sh"

### Helpers
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