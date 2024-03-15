if 0 {
	
	bp 0x20008 4 hw

	resume

	#should halt at 0x20008 because of bp fire

	reg pc
	
	resume
}


if 1 {
	
	reset halt
	puts [bp]
	puts [rbp all]
	puts [bp]
	bp 0x1004 2 hw
	resume 0x1004
	puts [reg pc] 

}
