#!/usr/bin/env bash

# Ensure local web development dependencies are installed.
# Homebrew
# Brew bundle
#  puma-dev dev server proxy
# Setup puma-dev
# Link port 3000 for
#   .test
#   .local.dev domains (a real-ish domain name, to allow for HSTS locked Google SSO redirects)

# List of TLDs that puma-dev will support by default.
puma_domains_supported='test:local.dev'

# Main Entry Point, is invoked at the end of the file.
function main() {
  start_task "Configuring puma-dev"
  echo

  install_homebrew
  brew_bundle
  setup_puma_dev
  configure_local_domains

  print_success "You can now access ${puma_domains_supported}"
  echo
}

# Note that if you want the `foo.local.dev` subdomain,
# you need to define the host as 'foo.local'
function configure_local_domains() {
  start_task "Setting up dev domains"
  echo 3000 > "${HOME}/.puma-dev/3k"
  echo 8000 > "${HOME}/.puma-dev/8k"
  end_task
  ls "${HOME}/.puma-dev/"
}

function install_homebrew() {
  start_task "🍺 Homebrew"
  if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    end_task
  else
    skip_task
  fi
}

function brew_bundle() {
  start_task "Brew Bundle"
  # SLOW so skip if puma-dev is installed
  if ! command -v puma-dev >/dev/null; then
    print_warning "Missing dependencies, installing"
    __actually_brew_bundle
    end_task
  else
    skip_task
  fi
}

function __actually_brew_bundle(){
brew bundle --file=- <<EOF
tap "puma/puma" # For puma-dev
brew "puma-dev"
EOF
}

function setup_puma_dev() {
  start_task "Setup puma-dev (local dev proxy)"
  if [[ $(curl --silent http://an-app-should-be-configured.test) != 'unknown app' ]]; then
    echo "Configuring puma-dev"
    sudo puma-dev -setup -d "${puma_domains_supported}"
    puma-dev -install -d "${puma_domains_supported}"
    end_task
  else
    skip_task
  fi
}

# ----- Utils
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