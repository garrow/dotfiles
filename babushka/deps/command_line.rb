dep 'terminal' do

end

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



