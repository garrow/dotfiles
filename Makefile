install:
	ln --verbose --force --symbolic ${PWD}/bootstrap.rc.sh ${HOME}/.bashrc 

dependencies:
	sudo apt-get install git vim xclip ack-grep realpath curl

desktop:
	sudo apt-get install xmonad dzen2 evolution pidgin glipper keepassx

development:
	sudo apt-get install postgresql postgresql-contrib pgadmin3 subversion






