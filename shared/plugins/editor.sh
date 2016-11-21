function editor {
  echo $EDITOR


  if [ "$EDITOR" == "" ]; then
    echo "No EDITOR Environment variable set, checking .env files"
    echo $PWD
    calling_directory=$PWD
    env_file="${PWD}/.env"

    echo "$env_file"
    if [ -e "$env_file" ] ; then
      echo "EXISTS"
      eval $(cat "${env_file}" | grep 'EDITOR')

    echo "EDITOR== ${EDITOR}"
    echo $EDITOR
    fi 
  fi

echo "FIN"

if [ "$EDITOR" == "" ]; then
  echo "Unable to find an editor to open the file"
  exit 1
else

  echo "Run editor: ${EDITOR}"
 # $("${EDITOR}" $@)
fi


}

