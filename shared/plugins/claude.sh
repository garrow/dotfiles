function plan() {
  local color=$1
  shift
  local session_name="$*"

  tab "$color"
  __set_iterm_jobname "$session_name"

  claude --permission-mode plan "/rename $session_name"
}
