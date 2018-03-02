#!/bin/bash

# Continously rerun rspec with the supplied commands.
# Removes the dependency on `guard`
export RESPEC_TIME_DEFAULT=5
export RESPEC_TIME=$RESPEC_TIME_DEFAULT
function respec()
{
if [ "$1" ]; then
    while true; do
        tod;
        rspec "$@"
        sleep $RESPEC_TIME;
    done
fi
}

# Outputs all input streamed, highlighting matches
function grep_highlight ()
{
if [ "$1" != "" ]; then
    grep -P --color=always "(\$|$1)"
fi
}

alias ghl=grep_highlight

# Filter arguments to only include files
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
