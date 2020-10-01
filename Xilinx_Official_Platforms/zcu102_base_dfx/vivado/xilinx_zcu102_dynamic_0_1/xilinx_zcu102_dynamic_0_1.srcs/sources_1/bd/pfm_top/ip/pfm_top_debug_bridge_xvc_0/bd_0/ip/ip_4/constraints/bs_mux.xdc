
set_clock_groups -logically_exclusive -group [get_clocks -of_objects [get_ports -scoped_to_current_instance soft_tck]] -group [get_clocks -of_objects [get_port -scoped_to_current_instance prim_tck]]
set_case_analysis 0 [get_pins -filter {REF_PIN_NAME=~CE0} -of_objects [get_cells -hierarchical -filter {NAME =~ "*u_bufg_mux*"}]]
set_case_analysis 0 [get_pins -filter {REF_PIN_NAME=~CE1} -of_objects [get_cells -hierarchical -filter {NAME =~ "*u_bufg_mux*"}]]
set_case_analysis 0 [get_pins -filter {REF_PIN_NAME=~I1} -of_objects [get_cells -hierarchical -filter {NAME =~ "*drck_INST_0*"}]]
set_clock_groups -logically_exclusive -group [get_clocks -of_objects [get_ports -scoped_to_current_instance soft_update]] -group [get_clocks -of_objects [get_ports -scoped_to_current_instance prim_tck]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*drck_i*"}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*capture_i*"}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*runtest_i*"}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*tms_i*"}]]



create_waiver -internal -quiet -type METHODOLOGY -id TIMING-14 -tags "1025927" -user "bs_mux" -desc "CDC is handled through handshake process" -scope \
-objects [get_cells -hierarchical -filter {NAME =~ "*drck_INST_0"}]
create_waiver -internal -quiet -type METHODOLOGY -id TIMING-14 -tags "1025927" -user "bs_mux" -desc "CDC is handled through handshake process" -scope \
-objects [get_cells -hierarchical -filter {NAME =~ "*update_INST_0"}]
