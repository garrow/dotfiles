# Main config file
# echo "zshrc"

source "${base_dotfiles_path}/bootstrap.sh"

setopt NO_CASE_GLOB
setopt AUTO_CD
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt CORRECT

setopt noCORRECT_ALL


## Setup shell completion
autoload -Uz compinit
compinit

## REVERT TO DEFAULT OPTIONS
# emulate -LR zsh

# echo ">>>>OPTIONS"
# setopt

#### Relies on Sorting by ALPHA - prefer hard coding dep order
# declare -A dependency_map
# dependency_map=(
#   [shared:core]="${base_dotfiles_path}/shared/core"
#   [shared:plugins]="${base_dotfiles_path}/shared/plugins"
#   [zsh:core]="${ZDOTDIR}/plugins"
#   [zsh:plugins]="${ZDOTDIR}/core"
# )

# for name in $(echo ${(k)dependency_map} | xargs -n1 | sort | xargs ); do
#     local directory=$dependency_map[$name]
#     load_shell_dependencies_from_directory "${name}" "${directory}"
# done

load_shell_dependencies_from_directory "shared:core"    "${base_dotfiles_path}/shared/core"
load_shell_dependencies_from_directory "zsh:core"       "${ZDOTDIR}/core"
load_shell_dependencies_from_directory "shared:plugins" "${base_dotfiles_path}/shared/plugins"
load_shell_dependencies_from_directory "zsh:plugins"    "${ZDOTDIR}/plugins"

load_dependency_file ${base_dotfiles_path}/extras.rc.sh "core:extras"

load_dependency_file ${HOME}/.extras.rc.sh "local:extras"