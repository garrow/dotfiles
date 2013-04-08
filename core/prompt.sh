if [ "$color_prompt" = "yes" ]; then
    source "${base_env_path}/core/colours.sh"
fi

function short_path {
    pwd | ruby ${base_env_path}/core/name.rb
}

function prompt_char {
    if [[ -d './.svn/' ]]; then echo '§' && return; fi
    git branch >/dev/null 2>/dev/null && echo '±' && return
    #hg root >/dev/null 2>/dev/null && echo '☿' && return
#    svn info  >/dev/null 2>/dev/null && echo '§' && return
    echo '○' 
}


export RVM_DEFAULT_RUBY="$(${HOME}/.rvm/bin/rvm list default string )"

function rb_ver {
  local rvm_loaded=`type -t rvm | grep -c '^function$'`
  if [ "$rvm_loaded" != "1" ]; then
    echo "ᴚ" # RVM is disabled.
  elif [ "$RVM_DEFAULT_RUBY" != "$RUBY_VERSION" ]; then
    echo "◇$(rvm-prompt u) "
    #echo "◇$(echo $RUBY_VERSION| cut -d- -f2) "
  fi
}

function rails_e {
  if [ "$RAILS_ENV" != '' ]; then
  echo "‡$RAILS_ENV " && return 
  fi
}


function stomp_e {
  if [ "$STOMPR_WEB_APP_CONFIG" != '' ]; then
	echo "$(basename $STOMPR_WEB_APP_CONFIG)"
  fi
}

#### GIT CONFIG
GIT_PS1_SHOWDIRTYSTATE=1     # * 
GIT_PS1_SHOWSTASHSTATE=1     # $
GIT_PS1_SHOWUNTRACKEDFILES=1 # %

PS1="$IBlue\$(short_path)$Color_Off \$(__git_ps1 \"<%s>\" )$Red\$(rb_ver)$Blue\$(rails_e)\$(stomp_e)$Color_Off\$(prompt_char) "
#PS1="$IBlue\w$Color_Off \$(__git_ps1 \"<%s>\" )$Red\$(rb_ver)$Blue\$(rails_e)\$(stomp_e)$Color_Off\$(prompt_char) "
PROMPT_COMMAND='echo -ne "\033]0;$(prompt_char) ${PWD} $(rb_ver)$(rails_e)\007"'
