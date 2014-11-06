# chruby plugin, loads chruby and provides prompt helper function
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
export DEFAULT_RUBY_VERSION="2.1.4"

function rb_ver {
	if [ "$RUBY_VERSION" == "" ]; then
		echo "ᴚ"
	elif [ "$RUBY_ENGINE" == "jruby" ]; then
		echo "♨ "
	elif [ "$RUBY_VERSION" == $DEFAULT_RUBY_VERSION ]; then
		echo ""
	elif [ "$RUBY_VERSION" == "1.9.3" ]; then
		echo "ᴿ"
	else
		echo "ℛ  $RUBY_VERSION"
	fi
    #echo "◇"
}

