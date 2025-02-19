
# Define shim function to be replaced by `/usr/local/opt/nvm/nvm.sh`
# An alias won't work, as nvm.sh bails: "nvm.sh:2963: defining function based on alias `nvm'""
function nvm(){
  __nvm_first_run
}

# Actually load nvm
__load_nvm() 
{
  export NVM_DIR="${HOME}/.nvm"

  if [ -d "${HOMEBREW_PREFIX}/opt/nvm" ]; then
    echo "🟢 🌋 NVM init (homebrew)"
    load_dependency_file "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" "🌋 NVM (homebrew)"
    load_dependency_file "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm" "🌋 NVM Completion (homebrew)"
  else
    echo "🟢 🌋 NVM init (manual install)"
    load_dependency_file "$NVM_DIR/nvm.sh" "🌋 NVM (manual install)"
    load_dependency_file "$NVM_DIR/bash_completion" "🌋 NVM Completion (manual install)"
    # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  fi
}

__nvm_first_run() {
    # echo "🟢 Lazy loading nvm"
    __load_nvm

    echo "🟢 Done lazy loading nvm"
    type nvm
    if [ $# -gt  0 ]; then
      nvm "$@"
    fi
}