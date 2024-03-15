echo "color print init..."
#print str in #Green
proc green_print {str} {

	puts -nonewline "\033\[32m"
	puts $str
	puts -nonewline "\033\[0m"

}


#print str in #Red 
proc red_print {str} {

	puts -nonewline "\033\[31m"
	puts $str
	puts -nonewline "\033\[0m"
	
}
