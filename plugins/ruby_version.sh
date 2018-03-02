#!/bin/bash
# chruby plugin, loads chruby and provides prompt helper function
#source /usr/local/share/chruby/chruby.sh
#source /usr/local/share/chruby/auto.sh

configured_ruby_version=$(cat ~/.ruby-version)
fallback_ruby_version="ruby-2.2.5"
export DEFAULT_RUBY_VERSION=${configured_ruby_version:-$fallback_ruby_version}

function rb_ver {
  local ruby_version
  ruby_version=$(rbenv local)

  if [ "$ruby_version" == "" ]; then
    echo "ᴚ"
  elif [ "$ruby_version" == "$DEFAULT_RUBY_VERSION" ]; then
    echo ""
  else
    echo "ᴿ$ruby_version"
  fi
}

