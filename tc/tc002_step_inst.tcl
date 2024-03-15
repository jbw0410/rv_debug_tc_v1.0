
# step_inst check
# for normal inst that don't change instruction flow
# new pc = pc + 4
#for jmp inst or inst that cause exception, or Interrupt taken
# new pc = target pc

echo "tc002_step_inst..."
proc tc002_step_inst { loop_step_inst } {

	echo "-------------------------------"
	echo "TC_002_step_inst started."

	upvar 1 $loop_step_inst loop_num
	
	halt	
	check_halted
	
	for {set i 0} {$i < $loop_num} {incr i} {
		
		puts "\n"$i
		
		set old_pc [get_reg -force pc]
		puts "old_pc is: $old_pc"
		check_halted
		
		step
		#puts [reg pc]
		
		set new_pc [get_reg -force pc]
		puts "new_pc is: $new_pc"
		check_halted
		        
	}
	
	resume
	check_resumed


	echo "TC_002_step_inst passed!"
	echo "-------------------------------"
}
