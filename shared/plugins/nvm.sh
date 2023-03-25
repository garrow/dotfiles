export NVM_DIR="${HOME}/.nvm"

if [ ! -d "${NVM_DIR}" ] ; then
    mkdir "${NVM_DIR}"
fi

load_dependency_file "/usr/local/opt/nvm/nvm.sh" "🌋 NVM"
load_dependency_file "/usr/local/opt/nvm/etc/bash_completion.d/nvm" "🌋 NVM Completion"

# [ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion