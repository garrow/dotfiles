#!/bin/zsh
# shellcheck shell=bash
source "./bootstrap.sh"
source "./shared/core/task_functions.sh"
source "./install/macos_install.sh"
source "./install/debian_install.sh"

WORKING_DIR=${PWD}
CONFIG_BASE_DIR="${WORKING_DIR}/config"

function install() {
  install_configs

  if is_macos; then
    macos_install
  fi

  if is_debian; then
    install_awesome_config
    install_zellij_config

    debian_install
  fi
}

function install_configs() {
  ensure_directories

  install_zsh_config
  install_vim_config
  install_git_config
}

function ensure_directories() {
  print_info 'ensure_directories'
  mkdir -p "${HOME}/projects/code"
  mkdir -p "${HOME}/.config"

  touch "${HOME}/.extras.rc.sh"
}

function link_dir_config(){
  local src_dir="${1:-NOT_EXIST}"
  local dest_dir="${2:-NOT_EXIST}"

  echo $src_dir


  if [ -d "${src_dir}" ] ; then
    echo "OK ${src_dir}"

  fi

}


function install_zsh_config() {
  print_info "ZSH"
  ln -vsnf "${WORKING_DIR}"/zsh/.zshenv "${HOME}"/.zshenv
  ln -vsnf "${WORKING_DIR}"/zsh/.zshrc "${HOME}"/.zshrc
  ln -vsnf "${CONFIG_BASE_DIR}"/input.rc "${HOME}"/.inputrc
}

function install_awesome_config() {
  print_info "awesome"
  ln -vsnf "${CONFIG_BASE_DIR}"/awesome/ "${HOME}"/.config
}

function install_zellij_config() {
  print_info "zellij"
  ln -vsnf "${CONFIG_BASE_DIR}"/zellij/ "${HOME}"/.config
}


function install_vim_config()
{
  print_info "VIM Conf"
  ln -vsnf "${CONFIG_BASE_DIR}/vim/vimrc" "${HOME}/.vimrc"
  ln -vsnf "${CONFIG_BASE_DIR}/vim/gvimrc" "${HOME}/.gvimrc"
  ln -vsnf "${CONFIG_BASE_DIR}/vim/" "${HOME}/.vim"
  mkdir -p "${HOME}/tmp/vim"
}

function install_git_config(){
  print_info "git config"
  ln -vsnf "${CONFIG_BASE_DIR}/git/gitconfig" "${HOME}"/.gitconfig
  ln -vsnf "${CONFIG_BASE_DIR}/git/gitignore_global" "${HOME}"/.gitignore_global
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
  echo "CHECK REPO CONFIG"
  print_warning "Checking Repo"
  print_info "➡️  test for remotes"
  git remote -v

  local DOTFILES_GIT_CONFIG="${CONFIG_BASE_DIR}/git/gitconfig"

  if [[ -e "${DOTFILES_GIT_CONFIG}" ]]; then
    print_info "Username:"
    git config --local --replace-all user.name "$(git config --file "${DOTFILES_GIT_CONFIG}" --get user.name)"
    git config --local --get user.name
    print_info "Email:"
    git config --local --replace-all user.email "$(git config --file "${DOTFILES_GIT_CONFIG}" --get user.email)"
    git config --local --get user.email
  fi
}

# ---------- Menu -------

function menu() {
  echo "Select a command:"
  for ((i=1; i<${#sub_commands[@]}; i++)); do
    echo "$i. ${sub_commands[$i]}"
  done
  echo "${#sub_commands[@]}. Quit"
}

# Echo a no-op to allow selecting any item
sub_commands=(install install_configs install_zsh_config install_bash_config install_homebrew_apps install_homebrew_cli check_repo_config echo)

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
  elif [[ " ${sub_commands[*]} " =~ " $1 " ]]; then
    exec "$1"
  else
    install_configs
    echo
    print_info "Installed configs only"
    echo "Use \`./first_install.sh install\` to install apps"

  fi
}

entry "$1"
