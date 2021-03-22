# Core functions to load other dependencies

#export DEBUG_DOTFILES=true
export DEBUG_DOTFILES=${DEBUG_DOTFILES:=false}
if [ "${DEBUG_DOTFILES}" = 'true' ]; then
  function debug_dotfiles(){
    echo "${1}"
  }
else
  function debug_dotfiles(){
    printf '.'
  }
fi

function load_dependency_file() {
  local file_to_load="${1}"
  local dependency_descriptor="[${2}] - "
  if [[ -f $file_to_load ]]; then
    debug_dotfiles "${dependency_descriptor}${file_to_load}"
    source "$file_to_load"
  else
    echo
    echo "!!! MISSING !!! ${dependency_descriptor}${file_to_load}"
  fi
}

function load_shell_dependencies_from_directory() {
  local descriptor=$1
  local directory=$2

  for file_to_load in $(find "${directory}" -name '*.sh' -type f)
  do
    load_dependency_file "$file_to_load" "${descriptor}"
  done
}
