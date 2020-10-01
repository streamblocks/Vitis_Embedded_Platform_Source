
##
## Create Clock Constraints on BSCAN ports DRCK & UPDATE
##
set clk_period [get_property PERIOD [get_clocks -of_objects [get_ports -scoped_to_current_instance tap_tck]]]
set max_delay [expr $clk_period/2]
set_max_delay $max_delay -from [get_cells -hierarchical -filter {NAME =~ "*USE_SOFTBSCAN.U_BSCAN_TAP/U_BASETAP/TDO_O_reg*"}] -through [get_ports -scoped_to_current_instance tap_tdo] -datapath_only
create_generated_clock -source [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*UPDATEDR_O_reg"}]] -divide_by 1 [get_pins -filter {REF_PIN_NAME=~Q} -of_objects [get_cells -hierarchical -filter {NAME =~ "*UPDATEDR_O_reg"}]]
#create_clock -period 30 [get_ports tap_tck]


create_waiver -internal -quiet -type METHODOLOGY -id TIMING-14 -tags "1025927" -user "bsip" -desc "CDC is handled through handshake process" -scope \
-objects [get_cells -hierarchical -filter {NAME =~ "*USE_SOFTBSCAN.U_BSCAN_TAP//i_*"}]
create_waiver -internal -quiet -type METHODOLOGY -id TIMING-14 -tags "1025927" -user "bsip" -desc "CDC is handled through handshake process" -scope \
-objects [get_cells -hierarchical -filter {NAME =~ "*USE_SOFTBSCAN.U_BSCAN_TAP/U_BASETAP/U_TAP/update_INST_0*"}]

