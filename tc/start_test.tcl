#---------------------------------------------------------------------
echo "--------------------------------------------------------------"
echo "                  Hi,there! This is Debug IT Test!                     "
echo "--------------------------------------------------------------"

#-------------current debug_dir path-----------------
# 
echo "------------------------------------------"
echo "current Debug IT base directory path is : "
echo "  $debug_base_dir"
echo "------------------------------------------"

#-------------lib func init--------------------------
# 
source ./tc/debug_lib/color_print.tcl
source ./tc/debug_lib/gen_random.tcl 
source ./tc/debug_lib/dmi_access_init.tcl
echo "debug lib proc init done..."
echo "------------------------------------"

#-------------tc init--------------------------------
#  
source ./tc/tc_init.tcl

echo "debug tc init done..."
echo "------------------------------------"

#-------------self-check-----------------------------
# 
source ./tc/debug_lib/check_halt_resume.tcl
source ./tc/debug_lib/check_reset.tcl
echo "self_check enabled..."
echo "------------------------------------"

#-------------source testcases-----------------------
#
echo "debug testcases started loading!"
source ./tc/tc001_halt_resume.tcl
source ./tc/tc002_step_inst.tcl
source ./tc/tc003_reset_core.tcl
source ./tc/tc004_reg_access.tcl
source ./tc/tc005_mem_access.tcl
source ./tc/tc006_bp_trig.tcl
source ./tc/tc007_wp_trig.tcl
echo "debug testcases finished loading!"
echo "------------------------------------"


#---------------------------------------------------------------------
#---------------------------------------------------------------------

echo "debug testcases started..."
#--------------run all the testcases--------------
#
for {set i 1} {$i <= $run_times} {incr i} {
	
	echo "----------------------------"
    echo "The $i run of all testcases!"
	echo "----------------------------"
    
    tc001_halt_resume 	loop_halt_resume
	tc002_step_inst 	loop_step_inst
	tc003_reset_core    loop_reset_core
	tc004_reg_access	loop_reg_access
	
	#tc005_mem_access	loop_mem_access
	tc006_bp_trig 		loop_bp_trig reset_pc
	
		#todo...
		#tc007_wp_trig	loop_wp_trig

}

echo "--------------------------------------------------------------"
echo "Congrats! All the tests passed!"

set now [clock seconds]
set date [clock format $now -format "%y-%m-%d %H:%M:%S"]
puts "Debug Test finished at: $date"

halt

echo "--------------------------------------------------------------"

