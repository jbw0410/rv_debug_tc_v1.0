echo "halt_resume self-check init..."

#get core halted/resumed state

proc get_halt_run_state {} {
	
	global dmstatus_addr
	#puts $dmstatus_addr

	#openocd command: riscv dmi_read 
	#read dmi bus address 0x11, get value of dmstatus
	set dmstatus [riscv dmi_read $dmstatus_addr]
	#puts $dmstatus
	
	#get bit [11:8] of dmstatus
	set halt_run_state [format 0x%x [expr {$dmstatus & 0xf00} ]]
	#puts $halt_run_state
	
	return $halt_run_state
}


proc check_halted {} {
	
	set core_state [get_halt_run_state]
	if { $core_state == 0x300 } {	
		
		set str "\ncore halted."
		green_print $str
		
	}

}


proc check_resumed {} {

	set core_state [get_halt_run_state]
	if { $core_state == 0xc00 } {	
		
		set str "\ncore resumed."
		#red_print $str
		green_print $str
		
	}
	
}





