# Meta level package
dep 'desktop' do 
	requires 'xmonad-shell', 'desktop-utils'  
end

dep 'xmonad-shell' do 
	requires 'xmonad.bin', 'dzen2.bin' #, 'xmonad-config' 
end

dep 'desktop-utils' do 
	requires 'communications', 'clipboard-manager', 'password-manager', 'notifications'
end

# Communications
dep 'communications' do requires 'pidgin', 'evolution' end

dep 'pidgin'    do 
	requires 'pidgin.bin'#, 'pidgin-sipe.bin' 
end
dep 'evolution' do requires 'evolution.bin' end

# TODO - OSX clyppan
dep 'clipboard-manager' do requires 'glipper.bin' end
dep 'password-manager'  do requires 'keepassx.bin' end
# TODO - OSX growl
dep 'notifications'     do 
	requires 'libnotify' 
end 

dep 'libnotify' do
	met? { in_path? 'notify-send' }
	requires_when_unmet { 
		on :ubuntu, 'ack.bin'
		otherwise 'libnotify-dev.bin', 'libnotify-bin.bin'
 	}
end


# Packages
dep 'xmonad.bin'
dep 'dzen2.bin'

dep 'evolution.bin'
dep 'pidgin.bin'
dep 'pidgin-sipe.bin'

dep 'glipper.bin'
dep 'keepassx.bin'

dep 'libnotify-dev.bin'
dep 'libnotify-bin.bin'