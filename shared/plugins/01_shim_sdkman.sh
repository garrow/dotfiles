# Lazy Load SDKMAN

__sdk_load(){
    if [ -e "${HOME}/.sdkman/bin/sdkman-init.sh" ] ; then
    load_dependency_file "${HOME}/.sdkman/bin/sdkman-init.sh" "SDKMAN - https://sdkman.io/"
    fi
}

__sdk_first_run() {
    echo "🟢 Lazy loading sdk - SDKManager"

    unalias sdk # Ensure we use the binary now.

    __sdk_load

    echo "🟢 Done"

    type sdk
    sdk $@
}



alias sdk=__sdk_first_run