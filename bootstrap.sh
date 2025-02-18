# Core functions to load other dependencies
export C_RED="$(tput setaf 1)"
export C_GREEN="$(tput setaf 2)"
export C_YELLOW="$(tput setaf 3)"
export C_BLUE="$(tput setaf 4)"
export C_MAGENTA="$(tput setaf 5)"
export C_CYAN="$(tput setaf 6)"
export C_WHITE="$(tput setaf 7)"
export C_RESET="$(tput sgr0)"

export DOTFILES_DISTRO='unknown'

if [[ "$(uname)" == 'Darwin' ]]; then
  DOTFILES_DISTRO=macos
elif [[ -x "$(command -v apt)"  ]]; then
  DOTFILES_DISTRO=debian
fi

function is_macos() {
  [[ "${DOTFILES_DISTRO}" == "macos"  ]]
}

function is_debian() {
  [[ "${DOTFILES_DISTRO}" == "debian"  ]]
}

function enable_debug_dotfiles() {
  echo "Enabling debug mode."
  echo "Use \`rld\` to reload now"

  touch "${HOME}/DEBUG_DOTFILES"
  export DEBUG_DOTFILES=true
}

function disable_debug_dotfiles()
{
  echo "Disabling debug mode."
  echo "Use \`rld\` to reload now"

  export DEBUG_DOTFILES=false
  rm "${HOME}/DEBUG_DOTFILES"
}

if [[ -e "${HOME}/DEBUG_DOTFILES" ]]; then
  echo "Found: ${HOME}/DEBUG_DOTFILES"
  enable_debug_dotfiles
fi

export DEBUG_DOTFILES=${DEBUG_DOTFILES:=false}
if [ "${DEBUG_DOTFILES}" = 'true' ]; then
  echo "🐛🐛🐛🐛$C_YELLOW ~~~~ In DEBUG_DOTFILES mode! ~~~~ $C_RESET🐛🐛🐛🐛"
  function debug_dotfiles(){
    echo "${1}"
  }
else
  function debug_dotfiles(){
    printf '.'
  }
fi


if [ "${DEBUG_DOTFILES}" = 'true' ]; then
  function track_dependency(){
    local dependency="${1/$HOME/${C_CYAN}~$C_RESET}"
    local descriptor="${2}"

    local timestamp="$__dotfiles_bench_last_start"
    local now="$EPOCHREALTIME"
    let distance=$((now - timestamp))
    typeset -g __dotfiles_bench_last_start="$now"

    printf "+%4fs %3d $C_GREEN%-20s $C_WHITE%s$C_RESET\n" "${distance}" "${loaded_dependencies}" "${descriptor}" "${dependency}"
  }
else
  function track_dependency(){
    local indicator='⣾⣽⣻⢿⡿⣟⣯⣷'
    # local indicator='◐◓◑◒'
    # local indicator='◰◳◲◱'
    idx=$((loaded_dependencies % ${#indicator}))

    printf "\e[160D\e[K🐚 ${indicator:$idx:1} %2d" "${loaded_dependencies}"
  }
fi


declare -i loaded_dependencies=0
typeset -g __dotfiles_bench_last_start="$EPOCHREALTIME"

function load_dependency_file() {
  local dependency_file="${1}"
  local descriptor="${2}"

  if [[ -f $dependency_file ]]; then
    loaded_dependencies+=1
    track_dependency "${dependency_file}" "${descriptor}"
    source "$dependency_file"
  else
    echo
    echo "$C_RED🛑 ERROR! Missing dependency file: $C_YELLOW${dependency_file} $C_CYAN(${descriptor})$C_RESET"
  fi
}

function load_shell_dependencies_from_directory() {
  local descriptor="${1}"
  local directory="${2}"

  for dependency_file in $(find "${directory}" -name '*.sh' -type f)
  do
    load_dependency_file "$dependency_file" "${descriptor}"
  done
}
