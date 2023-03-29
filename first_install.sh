# shellcheck shell=bash
source "./bootstrap.sh"
source "./shared/core/task_functions.sh"

WORKING_DIR=${PWD}

function install() {
  install_zsh_config
  install_vim_config
  install_git_config

  ensure_directories

  install_homebrew
  install_cli
  install_apps
  setup_apps
}

function ensure_directories() {
  print_info 'ensure_directories'
  mkdir -p "${HOME}/projects"
  touch "${HOME}/.extras.rc.sh"
}

function install_zsh_config() {
  print_info "ZSH"
	ln -vsnf "${WORKING_DIR}"/zsh/.zshenv "${HOME}"/.zshenv
}

function install_vim_config()
{
  print_info "VIM Conf"
	ln -vsnf "${WORKING_DIR}"/vim/vimrc "${HOME}"/.vimrc
	ln -vsnf "${WORKING_DIR}"/vim/gvimrc "${HOME}"/.gvimrc
	ln -vsnf "${WORKING_DIR}"/vim/ "${HOME}"/.vim
	mkdir -p "${HOME}"/tmp/vim
}

function install_git_config(){ 
  print_info "git config"
	ln -vsnf "${WORKING_DIR}"/git/gitconfig "${HOME}"/.gitconfig
	ln -vsnf "${WORKING_DIR}"/git/gitignore_global "${HOME}"/.gitignore_global
}

function install_homebrew() {
  print_info "🍺 Homebrew"
  if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
}

function install_cli() { 
  print_info "🖥️  CLI tools"
  cd "${WORKING_DIR}"/homebrew/command-line && brew bundle
  cd "${WORKING_DIR}" || return
}


function install_apps()
{
  print_info "🖥️  Apps"
  cd "${WORKING_DIR}"/homebrew/gui-apps && brew bundle
  cd "${WORKING_DIR}" || return
}

function setup_apps()
{
  print_info "App setup"
  print_info "Phoenix window manager"
  bin/bootstrap_phoenix.sh
}

# ------------- Only available by menu choice -------

#  Unused, but available via menu
function install_bash() {
  print_info "BASH"
  ln -vsnf "${WORKING_DIR}"/bash/bootstrap.rc.sh "${HOME}"/.bash_profile
	ln -vsnf "${WORKING_DIR}"/extras.rc.sh "${HOME}"/.extras.rc.sh
	ln -vsnf "${WORKING_DIR}"/input.rc "${HOME}"/.inputrc
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
sub_commands=(echo install_zsh install_bash install_apps install_cli check_repo_config)

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
    install
  fi
}

entry "$1"