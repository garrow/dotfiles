# Main config file

# Warn if this file has been modified by an external tool
if [[ -o interactive ]] && command -v git &>/dev/null; then
  if [[ -n "$(git -C "${base_dotfiles_path}" status --porcelain -- zsh/.zshrc 2>/dev/null)" ]]; then
    print -P "%F{yellow}⚠ .zshrc has uncommitted changes! Run 'git -C ${base_dotfiles_path} diff zsh/.zshrc' to inspect.%f"
  fi
  unset _zshrc_diff
fi

source "${base_dotfiles_path}/bootstrap.sh"
source "${base_dotfiles_path}/zsh/zshrc-actual"
# EOF