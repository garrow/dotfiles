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
