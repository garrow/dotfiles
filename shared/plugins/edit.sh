# Use the $EDITOR env var to edit with whatever editor I want in a certain directory
# export EDITOR=/usr/local/bin/mvim
export EDITOR=$(which vim)

function edit() {
  if [ -z "$EDITOR" ] ; then
    echo "No \$EDITOR defined"
    return 1
  fi

  CWD=$(pwd)

  # type $EDITOR > /dev/null 2>&1
  if ! type $EDITOR > /dev/null 2>&1 ; then
    echo "Supplied editor does not exist: '${EDITOR}'"
  else
    $EDITOR "${CWD}" "$@"
  fi
}
