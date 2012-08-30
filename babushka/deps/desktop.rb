# Meta level package
dep 'desktop' do
	requires 'xmonad-shell', 'communications', 'desktop-utils'
end

# Xmonad
dep 'xmonad-shell' do
	requires 'xmonad.bin', 'dzen2.bin' #, 'xmonad-config'
end
dep 'xmonad.bin'
dep 'dzen2.bin'

# Communications
dep 'communications' do
  requires 'pidgin.bin', 'pidgin-sipe.lib', 'evolution.bin'
end
dep 'pidgin.bin'
dep 'pidgin-sipe.lib'
dep 'evolution.bin'

# Utils
dep 'desktop-utils' do
  requires 'clipboard-manager', 'password-manager', 'notifications'
end
# TODO - OSX clyppan
dep 'clipboard-manager' do requires 'glipper.bin' end
dep 'password-manager'  do requires 'keepassx.bin' end
# TODO - OSX growl
dep 'notifications'     do requires 'libnotify-bin.bin', 'libnotify-dev.lib' end

dep 'glipper.bin'
dep 'keepassx.bin'
dep 'libnotify-dev.lib'
dep 'libnotify-bin.bin' do provides 'notify-send' end
