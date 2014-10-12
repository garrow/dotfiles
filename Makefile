install:
	ln -vsf ${PWD}/bootstrap.rc.sh ${HOME}/.bash_profile
	ln -vsf ${PWD}/vim/vimrc ${HOME}/.vimrc
	ln -vsf ${PWD}/vim ${HOME}/.vim
	ln -vsf ${PWD}/git/gitconfig ${HOME}/.gitconfig

dependencies:
	sudo apt-get install git vim xclip ack-grep realpath curl colordiff

desktop:
	sudo apt-get install xmonad dzen2 evolution pidgin pidgin-sipe glipper keepassx libnotify-dev libnotify-bin

development:
	sudo apt-get install postgresql postgresql-contrib pgadmin3 subversion libreadline6-dev






