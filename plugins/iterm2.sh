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
