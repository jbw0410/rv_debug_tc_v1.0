# bp 0x1000 4 		
# execute inst,ebreak (might involve memory mofidy,need write-access to the address space)

# bp 0x1000 4 hw     
# hardware-breakpoint, using trigger

# before hart fetch inst from ddr memory space, hart might start excuting from flash(boot-rom)
# In Spike, it might be:
#   0x1000 -> 0x1004 -> 0x1008 -> 0x100c -> 0x1010 -> 0x10110000 (DDR space, can be Read/Write)
# only in DDR space, might be able to set software-breakpoint

echo "tc006_bp_trig..."
proc tc006_bp_trig { loop_bp_trig reset_pc } {

	echo "------------------------"
	echo "TC_006_bp_trig started."
	echo "------------------------"

	upvar 1 $loop_bp_trig 	loop_num
	upvar 1 $reset_pc 	   	core_reset_pc
	set inst_num 	20
	set bp_num   	4
	
	halt	
	check_halted
	
	for {set i 1} {$i <= $loop_num} {incr i} {
		puts "-----------------------"
		puts "The {$i} th round of bp test"
		puts "-----------------------"
		
		reset halt
			
		# 1. record all the pc the inst flow touched	
			set inst_flow 	{}
			for {set j 0} {$j < $inst_num} {incr j} {					
				set pc_dict [get_reg -force pc]
				set cur_pc [dict get $pc_dict pc]			
				lappend inst_flow $cur_pc			
				step
			}				
			
			puts "\ninst_num is: $inst_num"
			#puts [llength $inst_flow]	
			puts "\ninst_flow PC trace:"
				foreach var $inst_flow {puts $var}		
				
	
		# 2. trim the list instructions to unique touched PC (increasing-order), with no repetition	
			# use [lsort] to sort the list of inst-pc 
			set touched_pc [lsort -unique $inst_flow]
			set unique_inst_num [llength $touched_pc]
			
			puts "\nunique_inst_num is: $unique_inst_num"
			puts "\ntouched_pc are (unique pc value...):"
				foreach var $touched_pc {puts $var}
			
			# min PC 
			puts "\nminimum touched PC is:"
			puts [lindex $touched_pc 0]	
			# max PC
			puts "maximum touched PC is:"
			puts [lindex $touched_pc [expr {$unique_inst_num -1}]]
								

			set min_idx 	1
			set max_idx		[expr {$unique_inst_num -1}]		
			puts "\nmin_idx is: $min_idx"
			puts "max_idx is: $max_idx"
					 
	
		# 3. set bp_num breakpoint inside the touched_pc 
			bp
			rbp all
			set bp_addr_idx [gen_nums_Random $min_idx $max_idx $bp_num]
			#puts $bp_addr_idx
			
			for {set j 0} {$j < $bp_num} {incr j} {
				
				set bp_size 2
				set tmp_idx [lindex $bp_addr_idx $j]
				set tmp_bp_addr [lindex $touched_pc $tmp_idx]
				
				# configure hardware breakpoint, with selected trigger (by tselect)
					# set [type] field of tdata1 
					# (mcontrol[63:60], 0xf-disable, 0x2-breakpoint/watchpoint enable)
				set tselect_val $j
				set tdata1_val 	0x2000000000000000
				# create a tcl dict to configure reg_list{tselect xxx tdata1 xxx}
				set dic [dict create tselect $j tdata1 $tdata1_val]
	
				puts [set_reg $dic]
				puts [get_reg -force {tselect tdata1}]
				
				# hardware breakpoint setting here...
					# OpenOCD command to set harware-breakpoint
				bp $tmp_bp_addr $bp_size hw	
				puts "the pc: $tmp_bp_addr set a hardware-breakpoint with bp-length: $bp_size"
			}
			
			puts "\n"
			puts [bp]

		
		# 4. re-run with random breakpoints all set.  			
						
			# should [resume], instead of using [reset], because reset will clear the trigger also
			# must resume from the very start, because if not, the inst_flow might already pass all the PC with bp set
			puts "\nresume from the start..."

			resume $core_reset_pc			
			
			for {set k 0} { $k < $bp_num} {incr k} {
				
				check_halted
			
				set dict_trig_pc [get_reg -force pc]
				set trig_pc $dict_trig_pc(pc)
				puts "hardware-bp triggerd! Core halt at: $trig_pc"
				puts [bp]
				puts [rbp $trig_pc]

				resume
					set tmp_interval [gen_Rand_Int 0 100]
			 		sleep $tmp_interval
			}					
		
			#remove all bp
			halt 
			rbp all
			
			# core will never halt, no hardware-bp is active
			resume 
			check_resumed
		
	}	
	

	#halt

	echo "----------------------"
	echo "TC_006_bp_trig passed!"
	echo "----------------------"
}





