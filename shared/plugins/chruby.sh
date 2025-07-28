if [ -e "${HOMEBREW_PREFIX}/share/chruby/chruby.sh" ] ; then
  load_dependency_file "${HOMEBREW_PREFIX}/share/chruby/chruby.sh" "plugin:chruby:core"
else
  report_failed_depenency "chruby"
fi

if [ -e "${HOMEBREW_PREFIX}/share/chruby/auto.sh" ] ; then
  load_dependency_file "${HOMEBREW_PREFIX}/share/chruby/auto.sh" "plugin:chruby:auto"
fi