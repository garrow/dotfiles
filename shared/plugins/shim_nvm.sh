# Expect this shell function is overridden when loading by `/usr/local/opt/nvm/nvm.sh`
__nvm_first_run() {
    unalias nvm

    echo "🟢 Lazy loading nvm"

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
    echo "🟢 Done"

    type nvm
    nvm $@
}

alias nvm=__nvm_first_run