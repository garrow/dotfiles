#!/bin/zsh
# shellcheck shell=bash
source "./bootstrap.sh"
source "./shared/core/task_functions.sh"
source "./install/macos_install.sh"
source "./install/ubuntu_install.sh"

WORKING_DIR=${PWD}
CONFIG_BASE_DIR="${WORKING_DIR}/config/"

function install() {
  install_configs

  if is_macos; then
    macos_install
  fi

  if is_ubuntu; then
    ubuntu_install
  fi
}

function install_configs() {
  install_zsh_config
  install_vim_config
  install_git_config
  install_awesome_config
  install_autostart_config



  ensure_directories
}

function ensure_directories() {
  print_info 'ensure_directories'
  mkdir -p "${HOME}/projects"
  touch "${HOME}/.extras.rc.sh"
}

function install_zsh_config() {
  print_info "ZSH"
  ln -vsnf "${WORKING_DIR}"/zsh/.zshenv "${HOME}"/.zshenv
  ln -vsnf "${WORKING_DIR}"/zsh/.zshrc "${HOME}"/.zshrc
  ln -vsnf "${WORKING_DIR}"/config/input.rc "${HOME}"/.inputrc
}

function install_awesome_config() {
  print_info "awesome"
  #mkdir -p "${HOME}/.config/awesome"
  ln -vsnf "${WORKING_DIR}"/config/awesome/ "${HOME}"/.config/
}

function install_autostart_config() {

  print_info "autostart"
  ln -vsnf "${WORKING_DIR}"/config/autostart/ "${HOME}"/.config/

}

function install_vim_config()
{
  print_info "VIM Conf"
	ln -vsnf "${CONFIG_BASE_DIR}"/vim/vimrc "${HOME}"/.vimrc
	ln -vsnf "${CONFIG_BASE_DIR}"/vim/gvimrc "${HOME}"/.gvimrc
	ln -vsnf "${CONFIG_BASE_DIR}"/vim/ "${HOME}"/.vim
	mkdir -p "${HOME}"/tmp/vim
}

function install_git_config(){
  print_info "git config"
	ln -vsnf "${CONFIG_BASE_DIR}"/git/gitconfig "${HOME}"/.gitconfig
	ln -vsnf "${CONFIG_BASE_DIR}"/git/gitignore_global "${HOME}"/.gitignore_global
}

# ------------- Only available by menu choice -------

#  Unused, but available via menu
function install_bash_config() {
  print_info "BASH"
  ln -vsnf "${WORKING_DIR}"/bash/bootstrap.rc.sh "${HOME}"/.bash_profile
	ln -vsnf "${WORKING_DIR}"/extras.rc.sh "${HOME}"/.extras.rc.sh
	ln -vsnf "${WORKING_DIR}"/config/input.rc "${HOME}"/.inputrc
}

function check_repo_config()
{
  print_warning "Checking Repo"
  print_info "➡️  test for remotes"
  git remote -v


  print_info "Lock in git username"
  git config --local --replace-all user.name "$(git config --file "${WORKING_DIR}/git/gitconfig" --get user.name)"
  git config --local --replace-all user.email "$(git config --file "${WORKING_DIR}/git/gitconfig" --get user.email)"
  git config --local --get user.name
  git config --local --get user.email
}

# ---------- Menu -------

function menu() {
  echo "Select a command:"
  for ((i=1; i<${#sub_commands[@]}; i++)); do
    echo "$i. ${sub_commands[$i]}"
  done
  echo "${#sub_commands[@]}. Quit"
}

# First echo is a no-op to allow 1 index
sub_commands=(echo install install_zsh_config install_bash_config install_homebrew_apps install_homebrew_cli check_repo_config)

function entry() {
  if [[ "$1" == "menu" ]]; then
    menu
    read choice

    if (( choice == ${#sub_commands[@]} )); then
      return
    elif (( choice >= 0 && choice < ${#sub_commands[@]} )); then
      ${sub_commands[$choice]}
    else
      echo "Invalid option. Please try again."
    fi
  else
    install_configs
    echo
    print_info "Installed configs"
    echo "Use \`./first_install.sh install\` to install apps"

  fi
}

entry "$1"
