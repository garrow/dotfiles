install:
	ln --verbose --force --symbolic ${PWD}/bootstrap.rc.sh ${HOME}/.bashrc 

dependencies:
	sudo apt-get install git xclip ack-grep fasd

