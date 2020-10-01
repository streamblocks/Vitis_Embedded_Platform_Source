
##
## Create Clock Constraints on BSCAN ports DRCK & UPDATE
##
set clk_period [get_property PERIOD [get_clocks -of_objects [get_ports -scoped_to_current_instance s_axi_aclk]]]
set tck_period [expr $clk_period * 8]
set max_delay [expr $tck_period/2]
create_generated_clock -source [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*/u_jtag_proc/tck_i_reg*"}]] -divide_by 8 [get_pins -filter {REF_PIN_NAME=~Q} -of_objects [get_cells -hierarchical -filter {NAME =~ "*/u_jtag_proc/tck_i_reg*"}]]
#create_clock -period $tck_period [get_ports -scoped_to_current_instance tck]

set_max_delay $max_delay -from [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tdi_output_reg[0]"}] -datapath_only
set_max_delay $max_delay -from [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tms_output_reg[0]"}] -datapath_only
#set_max_delay $max_delay -through [get_ports -scoped_to_current_instance tdo] -to [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tdo_buffer_reg[*][0]"}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ "*sync_reg1_reg*"}]

create_waiver -internal -scope -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tdi_output_reg[0]*"}]]  -tags "1025927" -user "axi_jtag" -description {CDC is handled through handshake process}
create_waiver -internal -scope -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tms_output_reg[0]*"}]]  -tags "1025927" -user "axi_jtag" -description {CDC is handled through handshake process}
create_waiver -internal -scope -type CDC -id CDC-15 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tdi_output_reg[0]*"}]]  -tags "1025927" -user "axi_jtag" -description {CDC is handled through handshake process}
