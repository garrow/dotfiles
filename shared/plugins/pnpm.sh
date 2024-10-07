PNPM_HOME_CANDIDATE="${HOME}/.local/share/pnpm"
if [ -e "${PNPM_HOME_CANDIDATE}" ] ; then
# pnpm
  export PNPM_HOME="${PNPM_HOME_CANDIDATE}"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
# pnpm end
fi


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