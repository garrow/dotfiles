#!/usr/bin/env bash

# rebuild using direnv hook bash >> plugins/direnv.sh
# eval "$(direnv hook bash)"

 # function direnv_init() {
 #   local envrcfile="$PWD/.envrc"
 # 
 #   if [ -f $envrcfile  ]; then
 #     echo ">>>Existing file<<<<"
 #     echo
 #     cat $envrcfile
 #   elif [ -f "$PWD/.env" ]; then
 #     echo "Installing dotenv plugin for envrc"
 #     echo "dotenv" >> $envrcfile
 #   fi
 # }

_direnv_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("/usr/local/bin/direnv" export bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if ! [[ "${PROMPT_COMMAND:-}" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi
