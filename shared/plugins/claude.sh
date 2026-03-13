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


function local_claude() {
  #echo "ANTHROPIC_BASE_URL=${ANTHROPIC_BASE_URL}"
  ANTHROPIC_BASE_URL='http://127.0.0.1:1234' claude
  #unset ANTHROPIC_BASE_URL
  #echo "ANTHROPIC_BASE_URL=${ANTHROPIC_BASE_URL}"
}

# Workaround ctrl+z not suspending claude properly, by unsetting TERM_PROGRAM and TERM_PROGRAM_VERSION env.
function cc(){
  env -u TERM_PROGRAM -u TERM_PROGRAM_VERSION claude
  #env -u TERM_PROGRAM -u TERM_PROGRAM_VERSION TERM=xterm-256color claude
}
