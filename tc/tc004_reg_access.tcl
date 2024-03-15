echo "tc004_reg_access..."
proc tc004_reg_access { loop_reg_access } {

	echo "-------------------------------"
	echo "TC_004_reg_access started."


	upvar 1 $loop_reg_access loop_num
	set check_reg_num 5
	
	for {set i 0} {$i < $loop_num} {incr i} {
		
		puts "\n"$i
		
		halt	
		check_halted		
		
		for {set tmp 0} {$tmp < $check_reg_num} {incr tmp} {
			
			#access to GPRs (integer, float-point, vector, CSRs)
			set rand_gpr_idx [gen_Rand_Int 0 65]
			#puts $rand_gpr_idx
			puts [reg $rand_gpr_idx]
		}
 		
 		set tmp_interval [gen_Rand_Int 0 100]
	 	#puts $tmp_interval
	 	sleep $tmp_interval
		
		resume
		check_resumed

	}
	
	echo "TC_004_reg_access passed!"
	echo "-------------------------------"
}


#m-mode reg
#get_reg -force {mstatus mepc mcause mtvec mscratch mtval medeleg mideleg mip mie misa}
#get_reg -force {marchid mvendorid mimpid mhartid mcycle mcounteren mcountinhibit }
#get_reg  -force {mconfigptr menvcfg menvcfgh mseccfg mtime mtimecmp}
# set_reg {xxx 0xffff_ffff}...

#s-mode reg 
#get_reg -force {sstatus stvec sip sie sscratch time cycle scounteren sepc scause stval senvcfg satp}
# set_reg {xxx 0xffff_ffff}...
