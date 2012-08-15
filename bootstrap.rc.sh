export base_env_path=${HOME}/bin/env

# Hard coded for the moment
export bashrc_location=${base_env_path}/ubuntu/ubuntu.bashrc.sh

#echo $bashrc_location

if [ -f $bashrc_location ]; then
  source $bashrc_location
fi

