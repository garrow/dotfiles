# color diffs for SVN
function svndiff () 
{
if [ "$1" != "" ]; then
svn diff $@ | colordiff;
else
svn diff | colordiff; 
fi
}

# Continously rerun rspec with the supplied commands. 
# Removes the dependency on `guard`
export RESPEC_TIME_DEFAULT=5
export RESPEC_TIME=$RESPEC_TIME_DEFAULT
function respec()
{
if [ $1 ]; then 
    while true; do 
        echo `tod`; 
        rspec $@
        sleep $RESPEC_TIME; 
    done
fi
}


function ctail () 
{
if [ "$1" != "" ]; then
tail -f $1 | ctail.php $2 ;
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
