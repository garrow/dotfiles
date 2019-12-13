#!/bin/bash
# shellcheck disable=SC1117
# Ignore literal backslash escapes

# Given 3 colors, red, green, blue in 0-255 range
# __set_iterm_tab_color 255 0 0    # Sets to full red
# __set_iterm_tab_color 40 40 40   # Dark Grey
# __set_iterm_tab_color 20 224 110 # Kickstarter Green
function __set_iterm_tab_color
{
  local red=$1
  local green=$2
  local blue=$3

  echo -ne "\033]6;1;bg;red;brightness;${red}\a"
  echo -ne "\033]6;1;bg;green;brightness;${green}\a"
  echo -ne "\033]6;1;bg;blue;brightness;${blue}\a"
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
