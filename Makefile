install:
	ln -vshf ${PWD}/bootstrap.rc.sh ${HOME}/.bash_profile
	ln -vshf ${PWD}/extras.rc.sh ${HOME}/.extras.rc.sh
	ln -vshf ${PWD}/input.rc ${HOME}/.inputrc
	ln -vshf ${PWD}/vim/vimrc ${HOME}/.vimrc
	ln -vshf ${PWD}/vim/gvimrc ${HOME}/.gvimrc
	ln -vshf ${PWD}/vim/ ${HOME}/.vim
	ln -vshf ${PWD}/git/gitconfig ${HOME}/.gitconfig
	ln -vshf ${PWD}/git/gitignore_global ${HOME}/.gitignore_global
	ln -vshf ${PWD}/Brewfile ${HOME}/Brewfile
	mkdir -p ${HOME}/tmp/vim


dependencies:
	sudo apt-get install git vim xclip ack-grep realpath curl colordiff

desktop:
	sudo apt-get install xmonad dzen2 evolution pidgin pidgin-sipe glipper keepassx libnotify-dev libnotify-bin

development:
	sudo apt-get install postgresql postgresql-contrib pgadmin3 subversion libreadline6-dev

test:
	find . -name '*.sh' | grep -v vim | grep -v vendor | grep -v extras | xargs shellcheck -x
