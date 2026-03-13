# Main config file

# Warn if this file has been modified by an external tool
if [[ -o interactive ]] && command -v git &>/dev/null; then
  _zshrc_file="${base_dotfiles_path}/zsh/.zshrc"
  _zshrc_diff="$(git -C "${base_dotfiles_path}" diff -- "$_zshrc_file" 2>/dev/null)"
  if [[ -n "$_zshrc_diff" ]]; then
    print -P "%F{yellow}⚠ .zshrc has uncommitted changes:%f"
    print "$_zshrc_diff"
    print -P "%F{yellow}Review and commit, or revert with: git -C ${base_dotfiles_path} checkout -- $_zshrc_file%f"
  fi
  unset _zshrc_file
  unset _zshrc_diff
fi

source "${base_dotfiles_path}/bootstrap.sh"
source "${base_dotfiles_path}/zsh/zshrc-actual"
# EOF