echo "dmi_access_init..."
# dmi bus address declare
global dmstatus_addr
global dmcontrol_addr  	
global hartinfo_addr 		
global hawindowsel_addr 	
global hawindow_addr 		
global abstractcs_addr 	
global command_addr 		
global abstractauto_addr 	
global confstrptr0_addr	
global nextdm_addr			
global data0_addr		
global progbuf0_addr		
global authdata_addr		
global haltsum0_addr		
global haltsum1_addr		
global haltsum2_addr		
global haltsum3_addr		
global sbcs_addr			
global sbaddress0_addr		
global sbaddress1_addr		
global sbaddress2addr		
global sbaddress3_addr		
global sbdata0_addr		
global sbdata1_addr		
global sbdata2_addr		
global sbdata3_addr		

# dmi bus address
set dmstatus_addr   	0x11
set dmcontrol_addr  	0x10
set hartinfo_addr 		0x12
set hawindowsel_addr 	0x14
set hawindow_addr 		0x15
set abstractcs_addr 	0x16
set command_addr 		0x17
set abstractauto_addr 	0x18
set confstrptr0_addr	0x19
set nextdm_addr			0x1d
set data0_addr			0x04
set progbuf0_addr		0x20
set authdata_addr		0x30
set haltsum0_addr		0x40
set haltsum1_addr		0x13
set haltsum2_addr		0x34
set haltsum3_addr		0x35
set sbcs_addr			0x38
set sbaddress0_addr		0x39
set sbaddress1_addr		0x3a
set sbaddress2_addr		0x3b
set sbaddress3_addr		0x37
set sbdata0_addr		0x3c
set sbdata1_addr		0x3d
set sbdata2_addr		0x3e
set sbdata3_addr		0x3f
