install_zsh: 	install_zsh_files	install_core

install_bash: 	install_bash_files	install_core

install_core: install_git install_vim install_brewfile

install_vim:
	ln -vsnf ${PWD}/vim/vimrc ${HOME}/.vimrc
	ln -vsnf ${PWD}/vim/gvimrc ${HOME}/.gvimrc
	ln -vsnf ${PWD}/vim/ ${HOME}/.vim
	mkdir -p ${HOME}/tmp/vim

install_git: 
	ln -vsnf ${PWD}/git/gitconfig ${HOME}/.gitconfig
	ln -vsnf ${PWD}/git/gitignore_global ${HOME}/.gitignore_global

# install_brewfile:
# 	ln -vsnf ${PWD}/Brewfile ${HOME}/Brewfile

install_zsh_files:
	ln -vsnf ${PWD}/zsh/.zshenv ${HOME}/.zshenv

install_bash_files:
	ln -vsnf ${PWD}/bash/bootstrap.rc.sh ${HOME}/.bash_profile
	ln -vsnf ${PWD}/extras.rc.sh ${HOME}/.extras.rc.sh
	ln -vsnf ${PWD}/input.rc ${HOME}/.inputrc

dependencies:
	sudo apt-get install git vim xclip ack-grep realpath curl colordiff

desktop:
	sudo apt-get install xmonad dzen2 evolution pidgin pidgin-sipe glipper keepassx libnotify-dev libnotify-bin

development:
	sudo apt-get install postgresql postgresql-contrib pgadmin3 subversion libreadline6-dev

test:
	find . -name '*.sh' | grep -v vim | grep -v vendor | grep -v extras | xargs shellcheck -x



bootstrap:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

check:
	shellcheck ./*.sh