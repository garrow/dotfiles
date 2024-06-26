function macos_install() {
  print_info "macOS install"

  install_homebrew
  install_homebrew_cli
  install_homebrew_apps
  install_appstore_apps
  setup_apps
}


function install_homebrew() {
  print_info "🍺 Homebrew"
  if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
}

function install_homebrew_cli() {
  print_info "🖥️  CLI tools"
  cd "${WORKING_DIR}"/install/homebrew/command-line && brew bundle
  cd "${WORKING_DIR}" || return
}

function install_homebrew_apps()
{
  print_info "🖥️  GUI Apps"
  cd "${WORKING_DIR}"/install/homebrew/gui-apps && brew bundle
  cd "${WORKING_DIR}" || return
}

function install_appstore_apps()
{
  print_info "🖥️  App Store Apps"
  cd "${WORKING_DIR}"/install/homebrew/mac-app-store && brew bundle
  cd "${WORKING_DIR}" || return
}

function setup_apps()
{
  print_info "App setup"
  print_info "Phoenix window manager"
  bin/bootstrap_phoenix.sh
}