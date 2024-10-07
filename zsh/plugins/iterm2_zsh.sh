set-window-title() {
  window_title="\e]0;${${PWD/#"$HOME"/~}/work\/code/w/c}\a"
  echo -ne "$window_title"
}


set-window-title
add-zsh-hook precmd set-window-title