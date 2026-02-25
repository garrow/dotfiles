function plan() {
  # If no arguments provided, enter plan mode without color/session setup
  if [[ $# -eq 0 ]]; then
    claude --permission-mode plan
    return
  fi

  local color=$1
  shift
  local session_name="$*"

  tab "$color"

  # If session name is provided, rename and pass to claude
  if [[ -n "$session_name" ]]; then
    __set_iterm_jobname "$session_name"
    claude --permission-mode plan "/rename $session_name"
  else
    claude --permission-mode plan
  fi
}
