# Expect this shell function is overridden when loading by `/usr/local/opt/nvm/nvm.sh`
nvm() {
    echo "🟢 🌋 NVM First run"
    export NVM_DIR="${HOME}/.nvm"

    if [ ! -d "${NVM_DIR}" ] ; then
        echo "Creating NVM_DIR: ${NVM_DIR}"
        mkdir "${NVM_DIR}"
    fi

    load_dependency_file "/usr/local/opt/nvm/nvm.sh" "🌋 NVM"
    load_dependency_file "/usr/local/opt/nvm/etc/bash_completion.d/nvm" "🌋 NVM Completion"
    echo
    echo "Loaded NVM! You can now call \`nvm\`"
}
