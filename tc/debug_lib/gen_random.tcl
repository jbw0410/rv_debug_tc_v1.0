echo "gen random numbers init..."
# get a random number (floating-point value!) between the range of {min, max}
proc gen_Rand { min max } {

	# get random float_point between [0.0, 1.0)
	set rd [expr rand()]
	
	# magnify rd to the range between [min, max)
	set result [expr {$rd * ($max - $min) + $min} ]
	
	return $result
	
}


# get a random Integer number between the range of {min, max}
proc gen_Rand_Int { min max } {

	return [expr int([gen_Rand $min $max])]
}

# get nums of random number (flaoting-point) between the range of {min, max}
proc gen_nums_Random {min max nums} {
	
	set valid_range [expr {$max - $min + 1} ]
	#puts $valid_range
	set gen_num_list {}
	#puts $gen_num_list
	
	if {$nums > $valid_range} {
		puts "can't get $nums unique value from the range of $min to $max!"
	} else {
		while {[llength $gen_num_list] < $nums} {
			set n [gen_Rand_Int $min $max]
			#puts $n
			if {$n ni $gen_num_list} {
				lappend gen_num_list $n
				#puts $gen_num_list
			}
		}
		#set gen_num_list [linsert $gen_num_list 0 {}]
	}
	set gen_num_list [lsort -integer $gen_num_list]
	#puts $gen_num_list
	return $gen_num_list
}
