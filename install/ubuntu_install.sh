function ubuntu_install() {
  print_info "Ubuntu install"

  print_info "apt-get update"
  sudo apt-get -qq update


  local required_packages=(git ripgrep direnv build-essential procps curl file xclip tree)

  print_info "Installing Packages ${required_packages}"

  for ((i=1; i<=${#required_packages[@]}; i++)); do
    print_info "  : Install ${required_packages[$i]}"
    sudo apt-get -qq install -y "${required_packages[$i]}"
  done

  print_info "Starship"
  curl -sS https://starship.rs/install.sh | sh

  print_info "Apps"
}
