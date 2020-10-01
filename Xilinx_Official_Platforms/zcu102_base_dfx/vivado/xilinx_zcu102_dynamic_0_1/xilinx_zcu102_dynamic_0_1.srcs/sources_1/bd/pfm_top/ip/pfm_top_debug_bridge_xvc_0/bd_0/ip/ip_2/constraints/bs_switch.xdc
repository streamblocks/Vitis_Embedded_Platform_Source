






#create_waiver -internal -quiet -type METHODOLOGY -id TIMING-2 -tags "1025927" -user "bs_switch" -desc "test" -scope \
#-objects [get_pins { DUT/U0/jtag_fallback/U0/bs_switch/inst/BSCAN_SWITCH.N_EXT_BSCAN.bscan_inst/SERIES7_BSCAN.bscan_inst/TCK }] 
#-objects [get_clocks { DUT/U0/jtag_fallback/U0/bs_switch/inst/BSCAN_SWITCH.N_EXT_BSCAN.bscan_inst/SERIES7_BSCAN.bscan_inst/TCK }]
create_waiver -internal -quiet -type METHODOLOGY -id TIMING-14 -tags "1025927" -user "bs_switch" -desc "CDC is handled through handshake process" -scope \
-objects [get_cells -hierarchical -filter {NAME =~ "*BSCAN_SWITCH.*EXT_BSCAN.bscan_switch/m_bscan_drck[*]_INST*"}]

