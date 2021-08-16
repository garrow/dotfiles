# Read by vimrc to choose the correct light/dark theme
function __AppleInterfaceStyle {
  local ais=$(defaults read -g AppleInterfaceStyle 2>/dev/null| tr '[:upper:]' '[:lower:]')

  ais=${ais:-light}
  echo $ais
}
export AppleInterfaceStyle=$(__AppleInterfaceStyle)