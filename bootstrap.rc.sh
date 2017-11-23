source /etc/profile

export DEBUG_DOTFILES=false
function debug_dotfiles(){
        if [ $DEBUG_DOTFILES == 'true' ]; then
                echo $1
        fi
}
export base_env_path=${HOME}/.dotfiles

if [ $(uname) == 'Darwin' ]
then
	export distro=osx
else
	export distro=ubuntu
fi
 
export bashrc_location=${base_env_path}/${distro}/bashrc.sh

source ${base_env_path}/core/bashrc.sh

if [ -f $bashrc_location ]; then
#  source $bashrc_location
    echo
fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH="$HOME/.yarn/bin:$PATH"
source ~/.bashrc
