# export C_NVM="$(tput setaf 28)"

# # this automatically calls nvm use in a directory with .nvmrc file
# # https://github.com/creationix/nvm#zsh
# autoload -U add-zsh-hook
# load-nvmrc() {
#   # local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local prefix="$C_NVM߷ nvmrc: $C_RESET"

#     local node_version="$(nvm version)"
#     # local nvmrc_node_version=$(cat $nvmrc_path | nvm version)
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       print -n $prefix
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       print -n $prefix
#       nvm use
#     fi
#   #  VERY SLOW!!!!
#   # elif [ "$(nvm version)" != "$(nvm version default)" ]; then
#   #   print -n $prefix
#   #   # print -n "߷ nvmrc: Reverting to nvm default version"
#   #   nvm use default --verbose
#   fi
# }


# use_nvm() {
#     printf '߷'  # NVM
    
#     export NVM_DIR="$HOME/.nvm"
#     [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use
#     [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" 

#     printf '🪄' # '.nvmrc'
#     add-zsh-hook chpwd load-nvmrc
#     # Noisy!
#     load-nvmrc >/dev/null 2>&1
#     #__step_done
# }
