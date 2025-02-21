# Load SDKMAN
__sdk_load(){
  if [ -e "${HOME}/.sdkman/bin/sdkman-init.sh" ] ; then
    load_dependency_file "${HOME}/.sdkman/bin/sdkman-init.sh" "SDKMAN - https://sdkman.io/"
  fi
}

# Eager load or lazy load
if true; then
  __sdk_load
else
  # Define shim function to be replaced by `/usr/local/opt/nvm/nvm.sh`
  # An alias won't work, as nvm.sh bails: "nvm.sh:2963: defining function based on alias `nvm'""
  __sdk_first_run() {
      echo "🟢 Lazy loading sdk - SDKManager"
      unalias sdk # Ensure we use the binary now.

      __sdk_load

      echo "🟢 Done"

      type sdk
      sdk $@
  }
  alias sdk=__sdk_first_run
fi
