install:
	ln --verbose --force --symbolic ${PWD}/bootstrap.rc.sh ${HOME}/.bashrc 

dependencies:
	sudo apt-get install git vim xclip ack-grep realpath curl

desktop:
	sudo apt-get install xmonad evolution pidgin glipper

