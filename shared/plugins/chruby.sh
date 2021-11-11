if [ -e /usr/local/share/chruby/chruby.sh ] ; then
  load_dependency_file /usr/local/share/chruby/chruby.sh "plugin:chruby:core"
  # debug_dotfiles "chruby"
  # source /usr/local/share/chruby/chruby.sh
fi

if [ -e /usr/local/share/chruby/auto.sh ] ; then
  load_dependency_file /usr/local/share/chruby/auto.sh "plugin:chruby:auto"
  # debug_dotfiles "(auto)"
  # source /usr/local/share/chruby/auto.sh
fi