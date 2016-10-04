# chruby plugin, loads chruby and provides prompt helper function
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

configured_ruby_version=$(cat ~/.ruby-version | cut -d- -f2)
fallback_ruby_version="2.3.1"
export DEFAULT_RUBY_VERSION=${configured_ruby_version:-fallback_ruby_version}

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
		echo "ᴿ$RUBY_VERSION"
	fi
    #echo "◇"
}

