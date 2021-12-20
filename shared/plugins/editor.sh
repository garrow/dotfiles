# shellcheck shell=bash 
function editor {
  # echo "$EDITOR"

  # # if [ "$EDITOR" == "" ]; then
  # #   echo "No EDITOR Environment variable set, checking .env files"
  # #   echo $PWD
  # #   calling_directory=$PWD
  # #   env_file="${PWD}/.env"

  # #   echo "$env_file"
  # #   if [ -e "$env_file" ] ; then
  # #     echo "EXISTS"
  # #     eval $(cat "${env_file}" | grep 'EDITOR')

  # #   echo "EDITOR== ${EDITOR}"
  # #   echo "$EDITOR"
  # #   fi 
  # # fi

  # echo "FIN"

  if [ "$EDITOR" = "" ]; then
    >&2 echo "No editor defined!"
  elif ! command -v "${EDITOR}" > /dev/null; then
    >&2 echo "Editor is invalid! ${EDITOR}"
  else
    echo "${EDITOR}"
  fi
}


function to_editor {
  only_files | xargs $EDITOR
}

alias storms='only_files | xargs storm'
