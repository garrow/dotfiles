#!/bin/bash

source "./bootstrap.sh"
source "./shared/core/task_functions.sh"

function main() {
  print_info "Deps"
  install_homebrew
  install_ansible
  print_info "Upsert system state"
  run_ansible
}

function run_ansible(){
  local PLAYBOOK="${base_dotfiles_path}/install/bootstrap.yaml"

#  ANSIBLE_LOCALHOST_WARNING=False \
#    ANSIBLE_INVENTORY_UNPARSED_WARNING=False \
#    ansible-playbook --check "${PLAYBOOK}"
#  # ansible-playbook --verbose --ask-become-pass "${PLAYBOOK}"
  ANSIBLE_LOCALHOST_WARNING=False \
    ANSIBLE_INVENTORY_UNPARSED_WARNING=False \
    ansible-playbook --ask-become-pass "${PLAYBOOK}"
}

function install_homebrew() {
  print_info "🍺 Homebrew"
  if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/ master/install.sh)"
  fi

  brew update
  local ret=$?
  if [ $ret -ne 0 ]; then
    print_info "🍺 Homebrew outdated packages:"
    brew outdated
  fi
}


function install_ansible(){
  print_info "Ansible"
  if ! command -v ansible-playbook >/dev/null  ; then
    echo "no ansible-playbook installed"

    if ! command -v apt >/dev/null; then
      brew install ansible
    else

      if ! command -v sudo >/dev/null; then
        print_warning "No sudo? Assuming root access"
        apt install ansible
      else
        sudo apt install -y nala ansible
      fi
    fi
  else
  end_task
  fi
}


main
