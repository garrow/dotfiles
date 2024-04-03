function only_files ()
{
while read -r fname; do
  if [ -f "$fname" ]; then
    echo "$fname" ;
#  else
#    echo "REJECTED:: $fname"
  fi
done
}


function cask () {
  local cmd="$1"
  shift 1
  brew "${cmd}" --cask "$@"
}
