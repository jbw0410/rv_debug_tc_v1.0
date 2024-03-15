# example of how to set value for a Core Register:

	#halt 
	#set_reg {pc 0x1000_0000}
echo "tc001_halt_resume..."
proc tc001_halt_resume { loop_halt_resume } {
	
	echo "-------------------------------"
	echo "TC_001_halt_resume started."


	upvar 1 $loop_halt_resume loop_num

	for {set i 0} {$i < $loop_num} {incr i} {
		
		puts "\n"$i
		
		halt
		check_halted
	 	
	 	set tmp_interval [gen_Rand_Int 0 100]
	 	#puts $tmp_interval
	 	sleep $tmp_interval
	 	
		resume
		check_resumed

	}

	#puts [riscv info]

	echo "TC_001_halt_resume passed!"
	echo "-------------------------------"

}












