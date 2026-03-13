function dotfiles() {
  local zshrc="${base_dotfiles_path}/zsh/.zshrc"
  case "$1" in
    lock)
      chmod a-w "$zshrc" && print -P "%F{green}Locked .zshrc (read-only)%f"
      ;;
    unlock)
      chmod u+w "$zshrc" && print -P "%F{yellow}Unlocked .zshrc (writable)%f"
      ;;
    *)
      __set_iterm_jobname "~/.dotfiles"
      __set_iterm_tab_color 85 85 105
      cd ~/.dotfiles/
      ;;
  esac
}
