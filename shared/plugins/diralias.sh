favdir() {
  local as=$1
  local directory=$2

  alias "${as}"="cd ${directory}"
}

favdirs() {
  alias | grep "='cd" | grep -v '\.\.' | sort
}

dir() {
  echo "NOT QUITE WORKING YET"
  #  shopt -s expand_aliases  # Bash
  setopt expand_aliases # zsh
  select opt in $(favdirs |cut -d= -f1); do $opt; break; done
}