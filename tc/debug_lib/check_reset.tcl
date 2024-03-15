echo "core_reset self-check init..."
# must include 
#	color_print.tcl
#	check_halt_resume.tcl 
# before this tcl script

proc check_reset { reset_pc } {
	 
	upvar 2 $reset_pc core_reset_pc
	
	set current_state [get_halt_run_state]
	if { $current_state == 0x300 } {
		
		#core is halted
		set current_pc [get_reg pc]
		puts $current_pc(pc)

		if { $current_pc(pc) != $core_reset_pc } {
			set str "\n Error! reset_pc is wrong!"
			red_print $str
			
			#todo: break, and goto test fail func, print log
			
		} else {
		
			set str "\n reset_pc is: $core_reset_pc"
			green_print $str
			
			return
		}
	} #todo: core is running...


}
