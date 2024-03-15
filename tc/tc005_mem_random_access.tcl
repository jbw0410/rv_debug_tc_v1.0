# debug spec defined 3 mechanism to access memory 
# 	program buffer 
#	system bus
#	abstract command
                                                                                                                                                                                                                                                                                                                                                                                                          
proc tc005_mem_access { loop_mem_access } {

	echo "-------------------------------"
	echo "TC_005_mem_access started."


	upvar 1 $loop_bp_trig loop_num
	for {set i 0} {$i < $loop_num} {incr i} {
		
		puts "\n"$i
		
		halt	
		check_halted		
		
		#access to memory (to be configured in start_test.tcl)
		for {set tmp 0} {$tmp < 3} {incr tmp} {
			
			while {$tmp_addr > 0x10110000 && $tmp_addr < 0x1011ffff} {
			
			# configure the way to read memory: 
				#riscv set_mem_access progbuf
				#riscv set_mem_access sysbus
				#riscv set_mem_access abstract 
				
				riscv set_mem_access progbuf
				read_memory 0x10110000 16 1
				
				riscv set_mem_access sysbus
				read_memory 0x10110000 16 1
				
				riscv set_mem_access abstract
				read_memory 0x10110000 16 1
				
				
				
				read_memory $tmp_addr 
				set $tmp_addr [expr {$tmp_addr + 0x4}]
			}
			
			set $tmp_addr 0x1011	
		}
 		
 		
	 	set tmp_interval [gen_Rand_Int 0 100]
	 	#puts $tmp_interval
	 	sleep $tmp_interval
		
		resume
		check_resumed

	}
	

	echo "TC_005_mem_access passed!"
	echo "-------------------------------"
}




