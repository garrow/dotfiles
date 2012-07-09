# color diffs for SVN
function svndiff () 
{
if [ "$1" != "" ]; then
svn diff $@ | colordiff;
else
svn diff |colordiff; 
fi
}

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


