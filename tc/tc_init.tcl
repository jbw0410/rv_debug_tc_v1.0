
#-----------------------------------------------------------------------
# round of all debug testcases
set run_times 100
echo "------------------------------------"
echo "all tc will run for $run_times round "



#-----------------------------------------------------------------------
# loop times inside each testcases
set loop_halt_resume 	1
set loop_step_inst 		2
set loop_reset_core		3
set loop_reg_access 	4
set loop_mem_access		5
set loop_bp_trig		6

echo "loop_halt_resume is:	$loop_halt_resume"
echo "loop_step_inst is:	$loop_step_inst"
echo "loop_reset_core is:	$loop_reset_core"
echo "loop_reg_access is:	$loop_reg_access"
echo "loop_mem_access is:	$loop_mem_access"
echo "loop_bp_trig is:	$loop_bp_trig"
echo "-------------------------------------------"


#-----------------------------------------------------------------------
#set reset_pc to accomodate different Core configuration

	#spike default reset_pc = 0x1000
set reset_pc 0x1000
echo "@Spike simulator, core reset pc is: $reset_pc"

	# nanhu-V3 branch: vector-chisel5, reset_pc = 0x1000_0000
#set reset_pc 0x10000000
#echo "@Vector-chisel5 branch, core reset pc is: $reset_pc"

	# nanhu-V3 branch: MMIO (release for Intel SOC), reset_pc = 0x20000
#set reset_pc 0x20000
#echo "@MMIO branch, core reset pc is: $reset_pc"






