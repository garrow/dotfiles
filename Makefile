install:
	ln -vshf ${PWD}/bootstrap.rc.sh ${HOME}/.bash_profile
	ln -vshf ${PWD}/extras.rc.sh ${HOME}/.extras.rc.sh
	ln -vshf ${PWD}/input.rc ${HOME}/.inputrc
	ln -vshf ${PWD}/vim/vimrc ${HOME}/.vimrc
	ln -vshf ${PWD}/vim/ ${HOME}/.vim
	ln -vshf ${PWD}/git/gitconfig ${HOME}/.gitconfig
	ln -vshf ${PWD}/git/gitignore_global ${HOME}/.gitignore_global

dependencies:
	sudo apt-get install git vim xclip ack-grep realpath curl colordiff

desktop:
	sudo apt-get install xmonad dzen2 evolution pidgin pidgin-sipe glipper keepassx libnotify-dev libnotify-bin

development:
	sudo apt-get install postgresql postgresql-contrib pgadmin3 subversion libreadline6-dev






