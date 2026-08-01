# Toggle git maintenance hourly schedule on/off
#
#   git-maintenance        Show current status
#   git-maintenance on     Enable hourly maintenance
#   git-maintenance off    Disable hourly maintenance
git-maintenance() {
  local plist="$HOME/Library/LaunchAgents/org.git-scm.git.hourly.plist"
  case "${1:-status}" in
    on)
      launchctl load "$plist" 2>/dev/null && echo "Git hourly maintenance enabled." || echo "Already enabled or plist missing."
      ;;
    off)
      launchctl bootout "gui/$(id -u)" "$plist" 2>/dev/null && echo "Git hourly maintenance disabled." || echo "Already disabled or plist missing."
      ;;
    status)
      if launchctl print "gui/$(id -u)/org.git-scm.git.hourly" &>/dev/null; then
        echo "Git hourly maintenance: enabled"
      else
        echo "Git hourly maintenance: disabled"
      fi
      ;;
    *) echo "Usage: git-maintenance [on|off|status]" ;;
  esac
}
