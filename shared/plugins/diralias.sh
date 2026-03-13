# favdir - bookmark directories as cd aliases
#
#   favdir <name> <dir>  Register a cd alias (used in rc files, e.g. scratch.rc.sh)
#   favdir               Interactively save the current directory to ~/.extras.rc.sh
#                        Prompts for an alias name, defaulting to the directory basename.
#
# Related:
#   favdirs              List all saved directory aliases
#   dir                  Interactively pick a favdir to cd into
favdir() {
  if [[ $# -ge 2 ]]; then
    local as="${1}"
    local directory="${2}"
    if [[ ! "${as}" =~ ^[a-zA-Z_][a-zA-Z0-9_-]*$ ]]; then
      echo "\n❌ Bad favdir: '${as}' is not a valid alias name (use alphanumeric, _, -).\n"
      return 1
    fi
    if [ -d "${directory}" ]; then
      alias "${as}"="cd \"${directory}\""
    else
      echo "\n❌ Bad favdir: '$C_CYAN${as}$C_RESET' => ${C_YELLOW}${directory}${C_RESET} does not exist.\n"
    fi
    return
  fi

  # No args + interactive: save current directory
  if [[ ! -t 0 ]]; then
    echo "Usage: favdir <name> <directory>"
    return 1
  fi

  local dir="$PWD"
  local portable_dir='${HOME}'"${dir#$HOME}"
  local default_name="$(basename "$dir")"
  local extras="$HOME/.extras.rc.sh"

  printf "Save ${C_CYAN}${dir}${C_RESET} as favdir [${default_name}]: "
  read name
  name="${name:-$default_name}"

  if grep -q "^favdir ${name} " "$extras" 2>/dev/null; then
    echo "favdir '${name}' already exists in ~/.extras.rc.sh"
    return 1
  fi

  alias "${name}"="cd \"${dir}\""
  echo "favdir ${name} \"${portable_dir}\"" >> "$extras"
  echo "Saved: favdir ${name} \"${portable_dir}\""
}

favdirs() {
  alias | grep "='cd" | grep -v '\.\.' | sort
}

dir() {
  select opt in $(favdirs |cut -d= -f1); do eval $opt; break; done
}