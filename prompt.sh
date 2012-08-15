# Reset
Color_Off='\[\033[00m\]'       # Text Reset

# Regular Colors
Black='\[\033[0;30m\]'        # Black
Red='\[\033[0;31m\]'          # Red
Green='\[\033[0;32m\]'        # Green
Yellow='\[\033[0;33m\]'       # Yellow
Blue='\[\033[0;34m\]'         # Blue
Purple='\[\033[0;35m\]'       # Purple
Cyan='\[\033[0;36m\]'         # Cyan
White='\[\033[0;37m\]'        # White

# Bold
BBlack='\[\033[1;30m\]'       # Black
BRed='\[\033[1;31m\]'         # Red
BGreen='\[\033[1;32m\]'       # Green
BYellow='\[\033[1;33m\]'      # Yellow
BBlue='\[\033[1;34m\]'        # Blue
BPurple='\[\033[1;35m\]'      # Purple
BCyan='\[\033[1;36m\]'        # Cyan
BWhite='\[\033[1;37m\]'       # White

# Underline
UBlack='\[\033[4;30m\]'       # Black
URed='\[\033[4;31m\]'         # Red
UGreen='\[\033[4;32m\]'       # Green
UYellow='\[\033[4;33m\]'      # Yellow
UBlue='\[\033[4;34m\]'        # Blue
UPurple='\[\033[4;35m\]'      # Purple
UCyan='\[\033[4;36m\]'        # Cyan
UWhite='\[\033[4;37m\]'       # White

# Background
On_Black='\[\033[40m\]'       # Black
On_Red='\[\033[41m\]'         # Red
On_Green='\[\033[42m\]'       # Green
On_Yellow='\[\033[43m\]'      # Yellow
On_Blue='\[\033[44m\]'        # Blue
On_Purple='\[\033[45m\]'      # Purple
On_Cyan='\[\033[46m\]'        # Cyan
On_White='\[\033[47m\]'       # White

# High Intensty
IBlack='\[\033[0;90m\]'       # Black
IRed='\[\033[0;91m\]'         # Red
IGreen='\[\033[0;92m\]'       # Green
IYellow='\[\033[0;93m\]'      # Yellow
IBlue='\[\033[0;94m\]'        # Blue
IPurple='\[\033[0;95m\]'      # Purple
ICyan='\[\033[0;96m\]'        # Cyan
IWhite='\[\033[0;97m\]'       # White

# Bold High Intensty
BIBlack='\[\033[1;90m\]'      # Black
BIRed='\[\033[1;91m\]'        # Red
BIGreen='\[\033[1;92m\]'      # Green
BIYellow='\[\033[1;93m\]'     # Yellow
BIBlue='\[\033[1;94m\]'       # Blue
BIPurple='\[\033[1;95m\]'     # Purple
BICyan='\[\033[1;96m\]'       # Cyan
BIWhite='\[\033[1;97m\]'      # White

# High Intensty backgrounds
On_IBlack='\[\033[0;100m\]'   # Black
On_IRed='\[\033[0;101m\]'     # Red
On_IGreen='\[\033[0;102m\]'   # Green
On_IYellow='\[\033[0;103m\]'  # Yellow
On_IBlue='\[\033[0;104m\]'    # Blue
On_IPurple='\[\033[10;95m\]'  # Purple
On_ICyan='\[\033[0;106m\]'    # Cyan
On_IWhite='\[\033[0;107m\]'   # White


function prompt_char {
    if [[ -d './.svn/' ]]; then echo '§' && return; fi
    git branch >/dev/null 2>/dev/null && echo '±' && return
    #hg root >/dev/null 2>/dev/null && echo '☿' && return
#    svn info  >/dev/null 2>/dev/null && echo '§' && return
    echo '○' 
}


export RVM_DEFAULT_RUBY="$(${HOME}/.rvm/bin/rvm list default string )"

function rb_ver {
  if [ "$RUBY_VERSION" == "" ]; then
    echo "! " # RVM is disabled.
  elif [ "$RVM_DEFAULT_RUBY" != "$RUBY_VERSION" ]; then
    echo "◇$(echo $RUBY_VERSION| cut -d- -f2) "
  fi
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

REPO_STATUS='(${prompt_char})'
# \[\033[01;34m\]

#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

#PROMPT_COMMAND='echo -ne "\w \$(rb_ver)\$(rails_e)"'
PS1="\[\033[01;34m\]\w\[\033[00m\] \$(__git_ps1 \"<%s>\" ) $Red\$(rb_ver)$Blue\$(rails_e)$Color_Off\$(prompt_char) "
#PS1="\[\033[01;34m\]\w\[\033[00m\] $Red\$(rb_ver)$Blue\$(rails_e)$Color_Off\$(prompt_char) "
PROMPT_COMMAND='echo -ne "\033]0;$(prompt_char) ${PWD} $(rb_ver)$(rails_e)\007"'



#PS1='\[\033[01;34m\]\w\[\033[00m\] \[\033[01;32m\]$(rb_ver)$(rails_e)$(prompt_char) '
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(rails_e)$(prompt_char) '
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]${REPO_STATUS} '
