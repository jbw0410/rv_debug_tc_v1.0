
#reset halt
#pc at boot-rom 0x20000


puts [get_reg -force dpc]
resume 

#run for some time
sleep 50
halt 

#! error. pc become 0x0000
puts [get_reg -force pc]
puts [reg pc]





for {set i 0} { $i < 10} {incr i} {
	step 
	# resume + set step-bit
		
	sleep 100
	
	puts "\ndoing step..."
	
	# if no error, then hart is halted
	puts [get_reg -force pc]
}

puts "\n"


