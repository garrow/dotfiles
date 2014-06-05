# The very awesome https://github.com/dronir/SpotifyControl
alias spotify="osascript ${base_env_path}/plugins/SpotifyControl.scpt"
alias m=__spotify_menu

__spotify_menu()
{
  SPOTIFY_COMMANDS=('play/pause' 'next' 'previous' 'info' 'shuffle' 'repeat');
  PS3="$(spotify --) >> "
  select opt in "${SPOTIFY_COMMANDS[@]}"; do spotify ${opt}; break; done
}
