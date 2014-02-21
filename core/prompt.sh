if [ "$color_prompt" = "yes" ]; then
  source "${base_env_path}/core/colours.sh"
fi

function short_path {
  pwd | ruby ${base_env_path}/core/name.rb
}

function prompt_char {
  # ±
  echo '🔺 '
}

function rb_ver {
  echo ""
}

function rails_e {
  if [ "$RAILS_ENV" != '' ]; then
    echo "‡$RAILS_ENV " && return
  fi
}


#### GIT CONFIG
GIT_PS1_SHOWDIRTYSTATE=1     # *
GIT_PS1_SHOWSTASHSTATE=1     # $
GIT_PS1_SHOWUNTRACKEDFILES=1 # %

# Prettify command branch name.
function __filtered_git_ps1 {
  git_ps1_string=$(__git_ps1 "%s")
  git_ps1_string="${git_ps1_string/master/Ⓜ️ }"
  git_ps1_string="${git_ps1_string/bugfix/🐛 }"
  git_ps1_string="${git_ps1_string/feature/💰 }"
  git_ps1_string="${git_ps1_string/refinement/🎓 }"
  echo "⌥ ${git_ps1_string}"
}


PS1="$IPurple\W$Color_Off\$(__filtered_git_ps1)$Red\$(rb_ver)$Blue\$(rails_e)$Color_Off$(prompt_char)"
PROMPT_COMMAND='echo -ne "\033]0;$(prompt_char) ${PWD} $(rb_ver)$(rails_e)\007"'
