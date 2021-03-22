# shellcheck disable=SC1117

# shellcheck disable=SC2154,SC1090

function prompt_char {
  #echo '🔺 '
  echo '☛ '
}

function rails_e {
  if [ "$RAILS_ENV" != '' ]; then
    echo "‡$RAILS_ENV " && return
  fi
}

#### GIT CONFIG
export GIT_PS1_SHOWDIRTYSTATE=1     # *
export GIT_PS1_SHOWSTASHSTATE=1     # $
export GIT_PS1_SHOWUNTRACKEDFILES=1 # %

# Prettify command branch name.
function __filtered_git_ps1_emoji {
  git_ps1_string=$(__git_ps1 "⌥ %s")
  #git_ps1_string="${git_ps1_string/master/Ⓜ️ }"
  #git_ps1_string="${git_ps1_string/bugfix/🐛 }"
  #git_ps1_string="${git_ps1_string/feat/💰 }"
  #git_ps1_string="${git_ps1_string/refine/🎓 }"
  #git_ps1_string="${git_ps1_string/spike/📌  }"
  echo "${git_ps1_string}"
}

# shellcheck disable=SC2154
# PS1="
# $IPurple\w$Color_Off\$(__filtered_git_ps1_emoji)$Red\$(rb_ver)$Blue\$(rails_e)$Color_Off
# $Green>$Color_Off "
#PROMPT_COMMAND='echo -ne "\033]0; ${PWD/#$HOME/~}\007"'
function __git_branch_name_prompt {
    git symbolic-ref --short HEAD 2> /dev/null
}


# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT="\$vcs_info_msg_0_"
zstyle ':vcs_info:git*' actionformats "%s  %b %m%u%c "
zstyle ':vcs_info:git*' formats "%F{64}%b%f (%a) %m%u%c "
# zstyle ':vcs_info:git:*' formats '%m %a  %c %F{64}%b%f'
# zstyle ':vcs_info:git*' actionformats "%b %m%u%c "
zstyle ':vcs_info:*' enable git

# PROMPT="%(?.%F{green}√.%F{red}?%?)%f \$rails_e %B%F{198}%2~%f%b %# "
PROMPT="\$rails_e %B%F{198}%~
%(?.%F{green}>.%F{red}%?>)%f%b "