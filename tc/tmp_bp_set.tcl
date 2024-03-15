#if 0 {
	for {set i 0} {$i < 12} {incr i} {
		#puts [get_reg {tselect tdata1 tdata2 tdata3 tinfo}]
		halt
		puts [get_reg -force {tselect tinfo}]
		set y [format 0x%x $i]
		#puts $i
		#puts $y
		puts [set_reg {tselect $y}]
	}
#}

sleep 100


if 0 {
	bp
	set offset 0x4
	set base_addr 0x2000
	set bp_len 2
	for {set j 0} {$j < 5} {incr j} {
		
		#do some hardware-bp set
		#bp $base_addr 2 hw
		set base_addr [format 0x%x [expr {$base_addr + $offset}]]
		puts $base_addr
		echo $j
		sleep 100
	}
}


if 0 {

	reset halt 
	puts [bp]
	set base_addr 0x2008
	puts [set_reg {tdata1 0x2000000000000000}]
	puts [get_reg -force tdata1 ]
	puts [bp $base_addr 2 hw]
	puts [bp]
	puts "temp test done!"
}
#once a hardware breakpoint is set 

# need to incr tselect 
# make sure to set tdata1 = 0x2000_0000_0000_0000
# then set [bp addr size hw]
