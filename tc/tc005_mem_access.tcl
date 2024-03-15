# debug spec defined 3 way to access memory
# program buffer, system bus ,abstract command
echo "tc005_mem_access..."
proc tc005_mem_access { loop_mem_access } {
	echo "-------------------------------"
	echo "TC_005_mem_access started."


	upvar 1 $loop_bp_trig loop_num
	# min_addr
	# max_addr
	# generate rand_base_addr  between {min_addr, max_addr}
	
	
	for {set i 0} {$i < $loop_num} {incr i} {
		
		puts "\n"$i
		
		halt	
		check_halted		
		
		#access to memory (to be configured in start_test.tcl)
		for {set tmp 0} {$tmp < 3} {incr tmp} {
			
			while {$tmp_addr > $min_addr && $tmp_addr < $max_addr} {
			
			
			#acc_size (Nanhu-V3  system-bus width, 64bit = 8 Bytes), can be confirmed by [riscv info]
			
			#element_num (Nanhu-V3  system-bus width, 64bit = 8 Bytes)
			#acc_num
			
			# configure the way to read memory: 
				#riscv set_mem_access progbuf
				#riscv set_mem_access sysbus
				#riscv set_mem_access abstract 
				
				riscv set_mem_access progbuf
				#read_memory 0x10110000 16 1
				read_memory $tmp_addr $acc_size $acc_num
				
				# when using system bus. memory can be accessed when hart is running...
				# because system bus is directly connected to L3 cache, can't access MMIO space through system bus
				# access to MMIO can only through program buffer (access memory or CSR regs are unsupported using abstract command...)
				{
				resume 
				riscv set_mem_access sysbus
				#read_memory 0x10110000 16 1
				halt
				}
				#Nanhu-V3  no support for  abstract command to access Memory
				#riscv set_mem_access abstract
				#read_memory 0x10110000 16 1
				read_memory $tmp_addr $acc_size $acc_num
				
				# min_addr
				# max_addr
				# generate rand_base_addr  between {min_addr, max_addr}
				
				read_memory $tmp_addr $acc_size $acc_num
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




