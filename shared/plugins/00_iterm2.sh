# shellcheck disable=SC1117
# Ignore literal backslash escapes

# Given 3 colors, red, green, blue in 0-255 range
# __set_iterm_tab_color 255 0 0    # Sets to full red
# __set_iterm_tab_color 40 40 40   # Dark Grey
# __set_iterm_tab_color 20 224 110 # Kickstarter Green
# __set_iterm_tab_color 30 215 96  # Spotify Green
function __set_iterm_tab_color
{
  local red=$1
  local green=$2
  local blue=$3

  echo -ne "\033]6;1;bg;red;brightness;${red}\a\033]6;1;bg;green;brightness;${green}\a\033]6;1;bg;blue;brightness;${blue}\a"

  # echo -ne "\033]6;1;bg;red;brightness;${red}\a"
  # echo -ne "\033]6;1;bg;green;brightness;${green}\a"
  # echo -ne "\033]6;1;bg;blue;brightness;${blue}\a"
}

function __reset_iterm_tab
{
  echo -e "\033]6;1;bg;*;default\a"
}

function __reset_iterm_defaults
{
  __reset_iterm_jobname
  __reset_iterm_tab
}

# Set Preferences->Profiles-> [profile name] -> General -> Badge: "\(user.jobName)" 
function  __set_iterm_jobname
{
  iterm2_set_user_var jobName "$@"
}
function __reset_iterm_jobname
{
  iterm2_set_user_var jobName ""
}


### Minimal iTerm2 customisation - Taken from iterm2_integration.in

function iterm2_begin_osc {
  printf "\033]"
}

function iterm2_end_osc {
  printf "\007"
}

function iterm2_set_user_var() {
  iterm2_begin_osc
  printf "1337;SetUserVar=%s=%s" "$1" "$(printf "%s" "$2" | base64 | tr -d '\n')"
  iterm2_end_osc
}



alias jobname="__set_iterm_jobname"

function tab() {
  case $1 in
    spotify)
        __set_iterm_tab_color 30 215 96
      ;;
    red)
      __set_iterm_tab_color 166 68 49
      ;;
    green)
      __set_iterm_tab_color 57 102 57
      ;;
    blue)
      __set_iterm_tab_color 35 97 142
      ;;
    yellow)
      __set_iterm_tab_color 164 128 49
      ;;
    magenta)
      __set_iterm_tab_color 100 65 109
      ;;
    cyan)
      __set_iterm_tab_color 37 106 118
      ;;
    white)
      __set_iterm_tab_color 234 230 230
      ;;
    teal)
      __set_iterm_tab_color 47 126 105
      ;;
    purple)
      __set_iterm_tab_color 87 39 109
      ;;
    orange)
      __set_iterm_tab_color 189 115 54
      ;;
    lime)
      __set_iterm_tab_color 126 169 38
      ;;
    brown)
      __set_iterm_tab_color 77 40 20
      ;;
    pink)
      __set_iterm_tab_color 167 70 86
      ;;
    grey)
      __set_iterm_tab_color 95 95 95
      ;;
    beige)
      __set_iterm_tab_color 203 179 146
      ;;
    reset)
      __reset_iterm_tab
      ;;
    *)
      echo "Invalid color. Supported colors are: 'reset', spotify, red, green, blue, yellow, magenta, cyan, white, teal, purple, orange, lime, brown, pink, grey, and beige."
      ;;
  esac
}