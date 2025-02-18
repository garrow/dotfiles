# Lazy Load Conda
__conda_first_run() {
    echo "🟢 Lazy loading conda"

    unalias conda # Ensure we use the binary now.
    eval "$(conda "shell.$(basename "${SHELL}")" hook)"

    echo "🟢 Done"

    type conda
    conda $@
}

# export __lazy_conda_exec="$(which conda)"

# echo $__lazy_conda_exec

alias conda=__conda_first_run
