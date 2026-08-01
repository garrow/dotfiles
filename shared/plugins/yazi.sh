# shellcheck shell=bash

# Custom config dir
export YAZI_CONFIG_HOME=${base_dotfiles_path}/config/yazi

# Yazi helper function to change current directory on exit.
#  - `q` to quit with CWD changed.
#  - `Q` to quit without changing.
# https://yazi-rs.github.io/docs/quick-start#keybindings
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  command rm -f -- "$tmp"
}
