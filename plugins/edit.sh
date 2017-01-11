# Use the $EDITOR env var to edit with whatever editor I want in a certain directory

function edit() {
  CWD=$(pwd)
  type $EDITOR > /dev/null 2>&1
  if [ $? -ne 0 ] ; then
    echo "Supplied editor does not exist ${EDITOR}"
  else
    $EDITOR "${CWD}" $@
  fi
}
