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
