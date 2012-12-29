source /etc/profile

export base_env_path=${HOME}/bin/env

if [ $(uname) == 'Darwin' ]
then
	echo "OSX"
	export distro=osx
else
	export distro=ubuntu
	echo "Assume ubuntu"
fi
 
export bashrc_location=${base_env_path}/${distro}/bashrc.sh

 export DEBUG_DOTFILES=true

if [ -f $bashrc_location ]; then
  source $bashrc_location
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
