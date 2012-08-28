#!/bin/bash

function install_nocase_completion()
{
	local inputrc="/etc/inputrc"
	local nocasecommand="set completion-ignore-case on"
	local install_date=`date +'%Y%m%d'` 
	local install_string="\n# Automatically installed by $0 -- $install_date\n$nocasecommand\n"

	if [[ -f $inputrc ]] ; then
		grep --silent  "$nocasecommand" $inputrc
		gres=$?
		if [ $gres -gt 0 ] ; then
			echo "Not installed, installing"

			echo -e $install_string  >> $inputrc
		fi
		echo $inputrc
	fi
}

install_nocase_completion

