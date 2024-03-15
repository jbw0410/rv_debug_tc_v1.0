

halt
set cur_dpc [get_reg -force dpc]
puts "dpc is:"$cur_dpc
for {set i 0} {$i < 50} {incr i} {

	set cur_pc [get_reg -force pc]
	#puts "\n"
	set cur_dpc [get_reg -force dpc]
	puts -nonewline $cur_pc
	puts $cur_dpc

}
set cur_dpc [get_reg -force dpc]
puts "dpc is:"$cur_dpc
resume
