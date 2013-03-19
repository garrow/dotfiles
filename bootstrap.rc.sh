source /etc/profile

export base_env_path=${HOME}/.dotfiles

if [ $(uname) == 'Darwin' ]
then
	echo "OSX"
	export distro=osx
else
	export distro=ubuntu
	echo "Ubuntu"
fi
 
export bashrc_location=${base_env_path}/${distro}/bashrc.sh

export DEBUG_DOTFILES=true

source ${base_env_path}/core/bashrc.sh

if [ -f $bashrc_location ]; then
#  source $bashrc_location
    echo
fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
