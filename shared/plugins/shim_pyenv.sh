# Lazy Init pyenv for virtualenv
__pyenv_first_run() {
    echo "🟢 Lazy loading pyenv (pyenv-virtualenv-init)"
    unalias pyenv # Ensure we use the binary now.

    # Taken from homebrew post install instructions for pyenv
    if command -v pyenv-virtualenv-init > /dev/null; then
      eval "$(pyenv virtualenv-init -)";
    fi

    type pyenv

    echo "🟢 Done"
    pyenv $@
}

alias pyenv=__pyenv_first_run