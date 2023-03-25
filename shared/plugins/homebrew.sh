# eval "$(/opt/homebrew/bin/brew shellenv)"
# sysctl -n machdep.cpu.brand_string
# Homebrew setup for Apple Silicon
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi