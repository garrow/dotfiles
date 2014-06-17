if [ "$color_prompt" = "yes" ]; then
  source "${base_env_path}/core/colours.sh"
fi

function prompt_char {
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
function __filtered_git_ps1_emoji {
  git_ps1_string=$(__git_ps1 "⌥ %s")
  git_ps1_string="${git_ps1_string/master/Ⓜ️ }"
  git_ps1_string="${git_ps1_string/bugfix/🐛 }"
  git_ps1_string="${git_ps1_string/feature/💰 }"
  git_ps1_string="${git_ps1_string/refinement/🎓 }"
  git_ps1_string="${git_ps1_string/spike/📌  }"
  echo "${git_ps1_string}"
}
PS1="
$IPurple\w$Color_Off\$(__filtered_git_ps1_emoji)$Red\$(rb_ver)$Blue\$(rails_e)$Color_Off
$Green>$Color_Off "
PROMPT_COMMAND='echo -ne "\033]0; ${PWD/#$HOME/~}\007"'
