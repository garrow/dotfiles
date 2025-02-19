PNPM_HOME_CANDIDATE="${HOME}/.local/share/pnpm"
PNPM_HOME_CANDIDATE2="${HOME}/Library/pnpm"

__load_pnpm(){
  if [ -e "${PNPM_HOME_CANDIDATE}" ] ; then
    export PNPM_HOME="${PNPM_HOME_CANDIDATE}"
    path+=("${PNPM_HOME}")
  elif [ -e "${PNPM_HOME_CANDIDATE2}" ] ; then
    export PNPM_HOME="${PNPM_HOME_CANDIDATE2}"
    path+=("${PNPM_HOME}")
  fi
}


alias pld=__pnpm_launch_desktop
function __pnpm_launch_desktop
{
  __set_iterm_tab_color 204 52 45
  __set_iterm_jobname 'desktop-launcher'
  pnpm launch:desktop
  __reset_iterm_defaults
}

alias pdev=__pnpm_desktop_dev
function __pnpm_desktop_dev
{
  __set_iterm_tab_color 204 52 45
  __set_iterm_jobname 'desktop-launcher'
  pnpm start:desktop
  __reset_iterm_defaults
}


__pnpm_first_run() {
    unalias pnpm

    echo "🟢 Lazy loading pnpm & nvm"
    __load_nvm
    __load_pnpm
    echo "🟢 Done"
    type pnpm

    if [ $# -gt  0 ]; then
      pnpm "$@"
    fi
}

alias pnpm=__pnpm_first_run