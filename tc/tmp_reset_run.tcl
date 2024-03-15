# @reset_halt
puts [get_reg -force dpc]
puts [get_reg -force pc]
puts [reg pc]

#reset run
reset

halt
puts [get_reg -force dpc]
puts [get_reg -force pc]
puts [reg pc]

resume
halt
puts [get_reg -force dpc]
puts [get_reg -force pc]
puts [reg pc]
