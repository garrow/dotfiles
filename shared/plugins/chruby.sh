if [ -e /usr/local/share/chruby/chruby.sh ] ; then
  debug_dotfiles "chruby"
  source /usr/local/share/chruby/chruby.sh
fi

if [ -e /usr/local/share/chruby/auto.sh ] ; then
  debug_dotfiles "(auto)"
  source /usr/local/share/chruby/auto.sh
fi