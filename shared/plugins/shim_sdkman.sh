# Lazy Load SDKMAN
__sdk_first_run() {
    echo "🟢 Lazy loading sdk - SDKManager"

    unalias sdk # Ensure we use the binary now.

    if [ -e "${HOME}/.sdkman/bin/sdkman-init.sh" ] ; then
    load_dependency_file "${HOME}/.sdkman/bin/sdkman-init.sh" "SDKMAN - https://sdkman.io/"
    fi

    echo "🟢 Done"

    type sdk
    sdk $@
}

debug_dotfiles "Inserted shim for sdk"

alias sdk=__sdk_first_run