# chruby plugin, loads chruby and provides prompt helper function
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

function rb_ver {
	if [ "$RUBY_VERSION" == "" ]; then
		echo ""
	elif [ "$RUBY_ENGINE" == "jruby" ]; then
		echo "♨"
	elif [ "$RUBY_VERSION" == "1.9.3" ]; then
		echo "⚑"
	else
		echo "ᴚ"
	fi
    #echo "◇"
}

