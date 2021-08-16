# 2021-08-16 DEPRECATED by the switch to Starship
# Determine the ruby version, based on the ruby default
configured_ruby_version=$(cat ~/.ruby-version 2&> /dev/null)
fallback_ruby_version="ruby-3.0.2"
export DEFAULT_RUBY_VERSION=${configured_ruby_version:-$fallback_ruby_version}
function rb_ver {
  local ruby_version
  if ! command rbenv ; then
    echo "Fatal: missing rbenv"
    return 127
  fi
  ruby_version=$(rbenv local 2>/dev/null)

  if [ "$ruby_version" == "" ]; then
    echo "ᴚ"♦️
  elif [ "$ruby_version" == "$DEFAULT_RUBY_VERSION" ]; then
    echo ""
  else
    echo "ᴿ$ruby_version"
  fi
}
