favdir() {
  local as=$1
  local directory=$2

  if [ -d "${directory}" ]; then 
    alias "${as}"="cd ${directory}"
  else
    echo "\n❌ Bad favdir: '$C_CYAN${as}$C_RESET' => ${C_YELLOW}${directory}${C_RESET} does not exist.\n"
  fi
}

favdirs() {
  alias | grep "='cd" | grep -v '\.\.' | sort
}

dir() {
  select opt in $(favdirs |cut -d= -f1); do eval $opt; break; done
}