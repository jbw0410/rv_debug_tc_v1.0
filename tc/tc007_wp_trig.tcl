
proc tc007_wp_trig {} {

	echo "-------------------------------"
	echo "TC_007_wp_trig started."

	# get global var, times of step_inst
	global times_bp_trig

	halt	
	check_halted
	
	for {set i 0} {$i < $times_bp_trig} {incr i} {
		
		puts "\n"$i
		
		set old_pc [get_reg -force pc]
		puts "old_pc is: $old_pc"
		
		#	

	}
	
	resume
	check_resumed


	echo "TC_007_wp_trig passed!"
	echo "-------------------------------"
}
