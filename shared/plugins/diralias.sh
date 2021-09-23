favdir() {
  local as=$1
  local directory=$2

  alias "${as}"="cd ${directory}"

  alias "${as}"
}

favdirs() {
  alias | grep "='cd" | sort
}

dir() {
  echo "NOT QUITE WORKING YET"
  #  shopt -s expand_aliases  # Bash
  setop aliases # zsh
  select opt in $(favdirs |cut -d= -f1); do "${opt}"; break; done
}