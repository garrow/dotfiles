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
  brew bundle --file "${WORKING_DIR}"/install/homebrew/command-line.Brewfile
}

function install_homebrew_apps()
{
  print_info "🖥️  GUI Apps"
  brew bundle --file "${WORKING_DIR}"/install/homebrew/gui-apps.Brewfile
}

function install_dev_apps()
{
  print_info "🖥️  Dev GUI Apps"
  brew bundle --file "${WORKING_DIR}"/install/homebrew/dev-tools.Brewfile
}

function install_appstore_apps()
{
  print_info "🖥️  App Store Apps"
  brew bundle --file "${WORKING_DIR}"/install/homebrew/mac-app-store.Brewfile
}

function setup_app_defaults()
{
  echo "Move Tab to New Window"
  defaults write com.google.Chrome NSUserKeyEquivalents -dict-add "Move Tab to New Window" "@~^n"

  echo "Show path icon in Finder toolbar"
  echo BEFORE
  defaults read com.apple.finder "NSToolbar Configuration Browser" | grep com.apple.finder.PATH

  defaults write com.apple.finder "$(defaults export com.apple.finder - | plutil -replace "NSToolbar Configuration Browser"."TB Item Identifiers" -json '["com.apple.finder.BACK", "com.apple.finder.PATH", "com.apple.finder.SWCH", "NSToolbarSpaceItem", "com.apple.finder.ARNG", "com.apple.finder.SHAR", "com.apple.finder.LABL", "com.apple.finder.ACTN", "NSToolbarSpaceItem", "com.apple.finder.SRCH"]' -o - -)"
  echo AFTER
  defaults read com.apple.finder "NSToolbar Configuration Browser" | grep com.apple.finder.PATH

  echo Sensible units - Metric
  defaults write 'Apple Global Domain' AppleTemperatureUnit Celsius
  defaults write 'Apple Global Domain' AppleMetricUnits 1
  defaults write 'Apple Global Domain' AppleICUDateFormatStrings -dict-add 1 "y-MM-dd"
}

function setup_apps()
{
  print_info "App setup"
  print_info "Default configs"
  setup_app_defaults
  print_info "Phoenix window manager"
  bin/bootstrap_phoenix.sh
}
