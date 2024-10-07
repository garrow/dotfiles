export PIP_DOWNLOAD_CACHE=$HOME/.cache/pip


# pipx
if command -v pipx > /dev/null ; then
  #echo "pipx detected"
  pipx ensurepath
fi
