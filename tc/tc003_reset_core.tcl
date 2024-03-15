echo "tc003_reset_core..."
proc tc003_reset_core { loop_reset_core } {
	
	echo "-------------------------------"
	echo "TC_003_reset_core started."
	
	upvar 1 $loop_reset_core loop_num
	halt	
	check_halted
	
	for {set i 0} {$i < $loop_num} {incr i} {
		
		puts "\n"$i
		
		resume
		check_resumed
		
	 	set tmp_interval [gen_Rand_Int 0 100]
	 		#puts $tmp_interval
	 	sleep $tmp_interval
		
		reset halt 
		# !!!MUST add some print here, otherwise openocd would read out wrong reset_pc
		#puts "\nsending command: reset halt..." 
		#puts "core halt immediately after reset at PC:"
		reg pc

		check_reset reset_pc

	}
	
	resume
	check_resumed

	echo "TC_003_reset_core passed!"
	echo "-------------------------------"

}
