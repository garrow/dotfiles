dep 'terminal' do
	requires 'xclip.bin', 'vim.bin', 'realpath.bin', 'curl.bin', 'colordiff.bin', 'csvtool.bin'end

dep 'ack' do
	met? { in_path? 'ack-grep' }
	requires_when_unmet { 
		on :ubuntu, 'ack.bin'
		otherwise 'ack.bin'
 	}


end

dep 'ack.bin' do
	installs {
		via :apt, 'ack-grep'
	}	
end

dep 'xclip.bin'
dep 'vim.bin'
dep 'realpath.bin'
dep 'curl.bin'
dep 'colordiff.bin'
dep 'csvtool.bin'




