# The very awesome https://github.com/dronir/SpotifyControl
# shellcheck disable=SC2139
alias spotify="osascript ${base_dotfiles_path}/shared/plugins/SpotifyControl.scpt"
alias m=__spotify_menu
alias mp="spotify play/pause"
alias mn='spotify next'
alias mprev='spotify previous'

__spotify_menu()
{
  SPOTIFY_COMMANDS=('play/pause' 'next' 'previous' 'info' 'shuffle' 'repeat');
  PS3="$(spotify --) >> "

  if [[ "$1" == "p" ]]; then
    spotify "play/pause"
  else
    select opt in "${SPOTIFY_COMMANDS[@]}"; do spotify "${opt}"; break; done
  fi
}
