source /etc/profile

export base_env_path=${HOME}/bin/env

# Hard coded for the moment
export bashrc_location=${base_env_path}/ubuntu/ubuntu.bashrc.sh

# export DEBUG_DOTFILES=true

if [ -f $bashrc_location ]; then
  source $bashrc_location
fi
