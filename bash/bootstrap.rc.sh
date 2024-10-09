#!/bin/bash
# shellcheck disable=SC1091,SC1090
source /etc/profile

export base_dotfiles_path="${HOME}/.dotfiles"
export work_dotfiles_path="${HOME}/work/dotfiles"
source "${base_dotfiles_path}/bootstrap.sh"

export bash_bash_env_path=${base_dotfiles_path}/bash/

if [ "$(uname)" == 'Darwin' ]
then
	export distro=osx
else
	export distro=debian
fi

export bashrc_location=${bash_bash_env_path}/${distro}/bashrc.sh

source "${bash_bash_env_path}/bashrc.sh"

if [ -f "$bashrc_location" ]; then
#  source $bashrc_location
    echo
fi

export PATH="$HOME/.yarn/bin:$PATH"
source ~/.bashrc
