
################################################################
# This is a generated script based on design: pfm_dynamic
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source pfm_dynamic_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu9eg-ffvb1156-2-e
   set_property BOARD_PART xilinx.com:zcu102:part0:3.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name pfm_dynamic

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: reset_controllers
proc create_hier_cell_reset_controllers { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_reset_controllers() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clkwiz_kernel2_clk_out1
  create_bd_pin -dir I clkwiz_kernel2_locked
  create_bd_pin -dir I -type clk clkwiz_kernel3_clk_out
  create_bd_pin -dir I -type clk clkwiz_kernel4_clk_out
  create_bd_pin -dir I -type clk clkwiz_kernel5_clk_out
  create_bd_pin -dir I -type clk clkwiz_kernel6_clk_out
  create_bd_pin -dir I -type clk clkwiz_kernel_clk_out1
  create_bd_pin -dir I clkwiz_kernel_locked
  create_bd_pin -dir I -type clk clkwiz_sysclks_clk_out2
  create_bd_pin -dir I clkwiz_sysclks_locked
  create_bd_pin -dir O -from 0 -to 0 -type rst psreset_gate_pr_control_interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst psreset_gate_pr_control_peripheral_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst psreset_gate_pr_kernel2_interconnect_aresetn_0
  create_bd_pin -dir O -from 0 -to 0 -type rst psreset_gate_pr_kernel3_interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst psreset_gate_pr_kernel4_interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst psreset_gate_pr_kernel5_interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst psreset_gate_pr_kernel6_interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst psreset_gate_pr_kernel_interconnect_aresetn
  create_bd_pin -dir I -from 0 -to 0 -type rst slice_reset_kernel_pr_Dout

  # Create instance: psreset_gate_pr_control, and set properties
  set psreset_gate_pr_control [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psreset_gate_pr_control ]
  set_property -dict [ list \
   CONFIG.C_AUX_RST_WIDTH {1} \
   CONFIG.C_EXT_RST_WIDTH {1} \
 ] $psreset_gate_pr_control

  # Create instance: psreset_gate_pr_kernel, and set properties
  set psreset_gate_pr_kernel [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psreset_gate_pr_kernel ]
  set_property -dict [ list \
   CONFIG.C_AUX_RST_WIDTH {1} \
   CONFIG.C_EXT_RST_WIDTH {1} \
 ] $psreset_gate_pr_kernel

  # Create instance: psreset_gate_pr_kernel2, and set properties
  set psreset_gate_pr_kernel2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psreset_gate_pr_kernel2 ]
  set_property -dict [ list \
   CONFIG.C_AUX_RST_WIDTH {1} \
   CONFIG.C_EXT_RST_WIDTH {1} \
 ] $psreset_gate_pr_kernel2

  # Create instance: psreset_gate_pr_kernel3, and set properties
  set psreset_gate_pr_kernel3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psreset_gate_pr_kernel3 ]
  set_property -dict [ list \
   CONFIG.C_AUX_RST_WIDTH {1} \
   CONFIG.C_EXT_RST_WIDTH {1} \
 ] $psreset_gate_pr_kernel3

  # Create instance: psreset_gate_pr_kernel4, and set properties
  set psreset_gate_pr_kernel4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psreset_gate_pr_kernel4 ]
  set_property -dict [ list \
   CONFIG.C_AUX_RST_WIDTH {1} \
   CONFIG.C_EXT_RST_WIDTH {1} \
 ] $psreset_gate_pr_kernel4

  # Create instance: psreset_gate_pr_kernel5, and set properties
  set psreset_gate_pr_kernel5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psreset_gate_pr_kernel5 ]
  set_property -dict [ list \
   CONFIG.C_AUX_RST_WIDTH {1} \
   CONFIG.C_EXT_RST_WIDTH {1} \
 ] $psreset_gate_pr_kernel5

  # Create instance: psreset_gate_pr_kernel6, and set properties
  set psreset_gate_pr_kernel6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psreset_gate_pr_kernel6 ]
  set_property -dict [ list \
   CONFIG.C_AUX_RST_WIDTH {1} \
   CONFIG.C_EXT_RST_WIDTH {1} \
 ] $psreset_gate_pr_kernel6

  # Create port connections
  connect_bd_net -net clkwiz_kernel3_clk_out_1 [get_bd_pins clkwiz_kernel3_clk_out] [get_bd_pins psreset_gate_pr_kernel3/slowest_sync_clk]
  connect_bd_net -net clkwiz_kernel4_clk_out_1 [get_bd_pins clkwiz_kernel4_clk_out] [get_bd_pins psreset_gate_pr_kernel4/slowest_sync_clk]
  connect_bd_net -net clkwiz_kernel5_clk_out_1 [get_bd_pins clkwiz_kernel5_clk_out] [get_bd_pins psreset_gate_pr_kernel6/slowest_sync_clk]
  connect_bd_net -net clkwiz_kernel6_clk_out_1 [get_bd_pins clkwiz_kernel6_clk_out] [get_bd_pins psreset_gate_pr_kernel5/slowest_sync_clk]
  connect_bd_net -net clkwiz_kernel_clk_out1 [get_bd_pins clkwiz_kernel_clk_out1] [get_bd_pins psreset_gate_pr_kernel/slowest_sync_clk]
  connect_bd_net -net dcm_locked_1 [get_bd_pins clkwiz_kernel_locked] [get_bd_pins psreset_gate_pr_kernel/dcm_locked] [get_bd_pins psreset_gate_pr_kernel3/dcm_locked] [get_bd_pins psreset_gate_pr_kernel4/dcm_locked] [get_bd_pins psreset_gate_pr_kernel5/dcm_locked] [get_bd_pins psreset_gate_pr_kernel6/dcm_locked]
  connect_bd_net -net dcm_locked_2 [get_bd_pins clkwiz_sysclks_locked] [get_bd_pins psreset_gate_pr_control/dcm_locked]
  connect_bd_net -net dcm_locked_4 [get_bd_pins clkwiz_kernel2_locked] [get_bd_pins psreset_gate_pr_kernel2/dcm_locked]
  connect_bd_net -net ext_reset_in_1 [get_bd_pins slice_reset_kernel_pr_Dout] [get_bd_pins psreset_gate_pr_control/ext_reset_in] [get_bd_pins psreset_gate_pr_kernel/ext_reset_in] [get_bd_pins psreset_gate_pr_kernel2/ext_reset_in] [get_bd_pins psreset_gate_pr_kernel3/ext_reset_in] [get_bd_pins psreset_gate_pr_kernel4/ext_reset_in] [get_bd_pins psreset_gate_pr_kernel5/ext_reset_in] [get_bd_pins psreset_gate_pr_kernel6/ext_reset_in]
  connect_bd_net -net psreset_gate_pr_control_interconnect_aresetn1 [get_bd_pins psreset_gate_pr_control_interconnect_aresetn] [get_bd_pins psreset_gate_pr_control/interconnect_aresetn]
  connect_bd_net -net psreset_gate_pr_control_peripheral_aresetn [get_bd_pins psreset_gate_pr_control_peripheral_aresetn] [get_bd_pins psreset_gate_pr_control/peripheral_aresetn]
  connect_bd_net -net psreset_gate_pr_kernel2_interconnect_aresetn [get_bd_pins psreset_gate_pr_kernel2_interconnect_aresetn_0] [get_bd_pins psreset_gate_pr_kernel2/interconnect_aresetn]
  connect_bd_net -net psreset_gate_pr_kernel3_interconnect_aresetn [get_bd_pins psreset_gate_pr_kernel3_interconnect_aresetn] [get_bd_pins psreset_gate_pr_kernel3/interconnect_aresetn]
  connect_bd_net -net psreset_gate_pr_kernel4_interconnect_aresetn [get_bd_pins psreset_gate_pr_kernel4_interconnect_aresetn] [get_bd_pins psreset_gate_pr_kernel4/interconnect_aresetn]
  connect_bd_net -net psreset_gate_pr_kernel5_interconnect_aresetn [get_bd_pins psreset_gate_pr_kernel5_interconnect_aresetn] [get_bd_pins psreset_gate_pr_kernel5/interconnect_aresetn]
  connect_bd_net -net psreset_gate_pr_kernel6_interconnect_aresetn [get_bd_pins psreset_gate_pr_kernel6_interconnect_aresetn] [get_bd_pins psreset_gate_pr_kernel6/interconnect_aresetn]
  connect_bd_net -net psreset_gate_pr_kernel_interconnect_aresetn [get_bd_pins psreset_gate_pr_kernel_interconnect_aresetn] [get_bd_pins psreset_gate_pr_kernel/interconnect_aresetn]
  connect_bd_net -net slowest_sync_clk_1 [get_bd_pins clkwiz_sysclks_clk_out2] [get_bd_pins psreset_gate_pr_control/slowest_sync_clk]
  connect_bd_net -net slowest_sync_clk_4 [get_bd_pins clkwiz_kernel2_clk_out1] [get_bd_pins psreset_gate_pr_kernel2/slowest_sync_clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: interrupt_concat
proc create_hier_cell_interrupt_concat { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_interrupt_concat() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 31 -to 0 xlconcat_interrupt_dout

  # Create instance: xlconcat_interrupt_0, and set properties
  set xlconcat_interrupt_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_interrupt_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {32} \
 ] $xlconcat_interrupt_0

  # Create port connections
  connect_bd_net -net xlconcat_interrupt_0_dout [get_bd_pins xlconcat_interrupt_dout] [get_bd_pins xlconcat_interrupt_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set interconnect_aximm_ddrmem2_M00_AXI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 interconnect_aximm_ddrmem2_M00_AXI ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {300000000} \
   CONFIG.HAS_REGION {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $interconnect_aximm_ddrmem2_M00_AXI

  set interconnect_aximm_ddrmem3_M00_AXI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 interconnect_aximm_ddrmem3_M00_AXI ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {300000000} \
   CONFIG.HAS_REGION {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $interconnect_aximm_ddrmem3_M00_AXI

  set interconnect_aximm_ddrmem4_M00_AXI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 interconnect_aximm_ddrmem4_M00_AXI ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {300000000} \
   CONFIG.HAS_REGION {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $interconnect_aximm_ddrmem4_M00_AXI

  set interconnect_aximm_ddrmem5_M00_AXI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 interconnect_aximm_ddrmem5_M00_AXI ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {300000000} \
   CONFIG.HAS_REGION {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $interconnect_aximm_ddrmem5_M00_AXI

  set regslice_control_userpf_M_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 regslice_control_userpf_M_AXI ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {75000000} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $regslice_control_userpf_M_AXI

  set regslice_data_hpm0fpd_M_AXI1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 regslice_data_hpm0fpd_M_AXI1 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {300000000} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {1} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {16} \
   CONFIG.MAX_BURST_LENGTH {256} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $regslice_data_hpm0fpd_M_AXI1


  # Create ports
  set bscanid_en [ create_bd_port -dir I bscanid_en ]
  set capture [ create_bd_port -dir I capture ]
  set clkwiz_kernel2_clk_out1 [ create_bd_port -dir I -type clk -freq_hz 300000000 clkwiz_kernel2_clk_out1 ]
  set clkwiz_kernel2_locked [ create_bd_port -dir I clkwiz_kernel2_locked ]
  set clkwiz_kernel3_clk_out [ create_bd_port -dir I -type clk -freq_hz 100000000 clkwiz_kernel3_clk_out ]
  set clkwiz_kernel4_clk_out [ create_bd_port -dir I -type clk -freq_hz 200000000 clkwiz_kernel4_clk_out ]
  set clkwiz_kernel5_clk_out [ create_bd_port -dir I -type clk -freq_hz 400000000 clkwiz_kernel5_clk_out ]
  set clkwiz_kernel6_clk_out [ create_bd_port -dir I -type clk -freq_hz 600000000 clkwiz_kernel6_clk_out ]
  set clkwiz_kernel_clk_out1 [ create_bd_port -dir I -type clk -freq_hz 150000000 clkwiz_kernel_clk_out1 ]
  set clkwiz_kernel_locked [ create_bd_port -dir I clkwiz_kernel_locked ]
  set clkwiz_sysclks_clk_out2 [ create_bd_port -dir I -type clk -freq_hz 75000000 clkwiz_sysclks_clk_out2 ]
  set clkwiz_sysclks_locked [ create_bd_port -dir I -type rst clkwiz_sysclks_locked ]
  set drck [ create_bd_port -dir I drck ]
  set pr_reset_n [ create_bd_port -dir I -from 0 -to 0 -type rst pr_reset_n ]
  set reset [ create_bd_port -dir I reset ]
  set runtest [ create_bd_port -dir I runtest ]
  set sel [ create_bd_port -dir I sel ]
  set shift [ create_bd_port -dir I shift ]
  set tck [ create_bd_port -dir I tck ]
  set tdi [ create_bd_port -dir I tdi ]
  set tdo [ create_bd_port -dir O tdo ]
  set tms [ create_bd_port -dir I tms ]
  set update [ create_bd_port -dir I update ]
  set xlconcat_interrupt_dout [ create_bd_port -dir O -from 31 -to 0 xlconcat_interrupt_dout ]

  # Create instance: axi_gpio_null, and set properties
  set axi_gpio_null [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_null ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.M00_HAS_REGSLICE {4} \
   CONFIG.M01_HAS_REGSLICE {4} \
   CONFIG.M02_HAS_REGSLICE {4} \
   CONFIG.M03_HAS_REGSLICE {4} \
   CONFIG.M04_HAS_REGSLICE {4} \
   CONFIG.M05_HAS_REGSLICE {4} \
   CONFIG.M06_HAS_REGSLICE {4} \
   CONFIG.M07_HAS_REGSLICE {4} \
   CONFIG.M08_HAS_REGSLICE {4} \
   CONFIG.M09_HAS_REGSLICE {4} \
   CONFIG.M10_HAS_REGSLICE {4} \
   CONFIG.M11_HAS_REGSLICE {4} \
   CONFIG.M12_HAS_REGSLICE {4} \
   CONFIG.M13_HAS_REGSLICE {4} \
   CONFIG.M14_HAS_REGSLICE {4} \
   CONFIG.M15_HAS_REGSLICE {4} \
   CONFIG.M16_HAS_REGSLICE {4} \
   CONFIG.M17_HAS_REGSLICE {4} \
   CONFIG.M18_HAS_REGSLICE {4} \
   CONFIG.M19_HAS_REGSLICE {4} \
   CONFIG.M20_HAS_REGSLICE {4} \
   CONFIG.M21_HAS_REGSLICE {4} \
   CONFIG.M22_HAS_REGSLICE {4} \
   CONFIG.M23_HAS_REGSLICE {4} \
   CONFIG.M24_HAS_REGSLICE {4} \
   CONFIG.M25_HAS_REGSLICE {4} \
   CONFIG.M26_HAS_REGSLICE {4} \
   CONFIG.M27_HAS_REGSLICE {4} \
   CONFIG.M28_HAS_REGSLICE {4} \
   CONFIG.M29_HAS_REGSLICE {4} \
   CONFIG.M30_HAS_REGSLICE {4} \
   CONFIG.M31_HAS_REGSLICE {4} \
   CONFIG.M32_HAS_REGSLICE {4} \
   CONFIG.M33_HAS_REGSLICE {4} \
   CONFIG.M34_HAS_REGSLICE {4} \
   CONFIG.M35_HAS_REGSLICE {4} \
   CONFIG.M36_HAS_REGSLICE {4} \
   CONFIG.M37_HAS_REGSLICE {4} \
   CONFIG.M38_HAS_REGSLICE {4} \
   CONFIG.M39_HAS_REGSLICE {4} \
   CONFIG.M40_HAS_REGSLICE {4} \
   CONFIG.M41_HAS_REGSLICE {4} \
   CONFIG.M42_HAS_REGSLICE {4} \
   CONFIG.M43_HAS_REGSLICE {4} \
   CONFIG.M44_HAS_REGSLICE {4} \
   CONFIG.M45_HAS_REGSLICE {4} \
   CONFIG.M46_HAS_REGSLICE {4} \
   CONFIG.M47_HAS_REGSLICE {4} \
   CONFIG.M48_HAS_REGSLICE {4} \
   CONFIG.M49_HAS_REGSLICE {4} \
   CONFIG.M50_HAS_REGSLICE {4} \
   CONFIG.M51_HAS_REGSLICE {4} \
   CONFIG.M52_HAS_REGSLICE {4} \
   CONFIG.M53_HAS_REGSLICE {4} \
   CONFIG.M54_HAS_REGSLICE {4} \
   CONFIG.M55_HAS_REGSLICE {4} \
   CONFIG.M56_HAS_REGSLICE {4} \
   CONFIG.M57_HAS_REGSLICE {4} \
   CONFIG.M58_HAS_REGSLICE {4} \
   CONFIG.M59_HAS_REGSLICE {4} \
   CONFIG.M60_HAS_REGSLICE {4} \
   CONFIG.M61_HAS_REGSLICE {4} \
   CONFIG.M62_HAS_REGSLICE {4} \
   CONFIG.M63_HAS_REGSLICE {4} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
   CONFIG.S00_HAS_REGSLICE {4} \
 ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
   CONFIG.M00_HAS_REGSLICE {4} \
   CONFIG.M01_HAS_REGSLICE {4} \
   CONFIG.M02_HAS_REGSLICE {4} \
   CONFIG.M03_HAS_REGSLICE {4} \
   CONFIG.M04_HAS_REGSLICE {4} \
   CONFIG.M05_HAS_REGSLICE {4} \
   CONFIG.M06_HAS_REGSLICE {4} \
   CONFIG.M07_HAS_REGSLICE {4} \
   CONFIG.M08_HAS_REGSLICE {4} \
   CONFIG.M09_HAS_REGSLICE {4} \
   CONFIG.M10_HAS_REGSLICE {4} \
   CONFIG.M11_HAS_REGSLICE {4} \
   CONFIG.M12_HAS_REGSLICE {4} \
   CONFIG.M13_HAS_REGSLICE {4} \
   CONFIG.M14_HAS_REGSLICE {4} \
   CONFIG.M15_HAS_REGSLICE {4} \
   CONFIG.M16_HAS_REGSLICE {4} \
   CONFIG.M17_HAS_REGSLICE {4} \
   CONFIG.M18_HAS_REGSLICE {4} \
   CONFIG.M19_HAS_REGSLICE {4} \
   CONFIG.M20_HAS_REGSLICE {4} \
   CONFIG.M21_HAS_REGSLICE {4} \
   CONFIG.M22_HAS_REGSLICE {4} \
   CONFIG.M23_HAS_REGSLICE {4} \
   CONFIG.M24_HAS_REGSLICE {4} \
   CONFIG.M25_HAS_REGSLICE {4} \
   CONFIG.M26_HAS_REGSLICE {4} \
   CONFIG.M27_HAS_REGSLICE {4} \
   CONFIG.M28_HAS_REGSLICE {4} \
   CONFIG.M29_HAS_REGSLICE {4} \
   CONFIG.M30_HAS_REGSLICE {4} \
   CONFIG.M31_HAS_REGSLICE {4} \
   CONFIG.M32_HAS_REGSLICE {4} \
   CONFIG.M33_HAS_REGSLICE {4} \
   CONFIG.M34_HAS_REGSLICE {4} \
   CONFIG.M35_HAS_REGSLICE {4} \
   CONFIG.M36_HAS_REGSLICE {4} \
   CONFIG.M37_HAS_REGSLICE {4} \
   CONFIG.M38_HAS_REGSLICE {4} \
   CONFIG.M39_HAS_REGSLICE {4} \
   CONFIG.M40_HAS_REGSLICE {4} \
   CONFIG.M41_HAS_REGSLICE {4} \
   CONFIG.M42_HAS_REGSLICE {4} \
   CONFIG.M43_HAS_REGSLICE {4} \
   CONFIG.M44_HAS_REGSLICE {4} \
   CONFIG.M45_HAS_REGSLICE {4} \
   CONFIG.M46_HAS_REGSLICE {4} \
   CONFIG.M47_HAS_REGSLICE {4} \
   CONFIG.M48_HAS_REGSLICE {4} \
   CONFIG.M49_HAS_REGSLICE {4} \
   CONFIG.M50_HAS_REGSLICE {4} \
   CONFIG.M51_HAS_REGSLICE {4} \
   CONFIG.M52_HAS_REGSLICE {4} \
   CONFIG.M53_HAS_REGSLICE {4} \
   CONFIG.M54_HAS_REGSLICE {4} \
   CONFIG.M55_HAS_REGSLICE {4} \
   CONFIG.M56_HAS_REGSLICE {4} \
   CONFIG.M57_HAS_REGSLICE {4} \
   CONFIG.M58_HAS_REGSLICE {4} \
   CONFIG.M59_HAS_REGSLICE {4} \
   CONFIG.M60_HAS_REGSLICE {4} \
   CONFIG.M61_HAS_REGSLICE {4} \
   CONFIG.M62_HAS_REGSLICE {4} \
   CONFIG.M63_HAS_REGSLICE {4} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
   CONFIG.S00_HAS_REGSLICE {4} \
 ] $axi_interconnect_1

  # Create instance: axi_interconnect_hpm0fpd, and set properties
  set axi_interconnect_hpm0fpd [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_hpm0fpd ]
  set_property -dict [ list \
   CONFIG.M00_HAS_REGSLICE {4} \
   CONFIG.M01_HAS_REGSLICE {4} \
   CONFIG.M02_HAS_REGSLICE {4} \
   CONFIG.M03_HAS_REGSLICE {4} \
   CONFIG.M04_HAS_REGSLICE {4} \
   CONFIG.M05_HAS_REGSLICE {4} \
   CONFIG.M06_HAS_REGSLICE {4} \
   CONFIG.M07_HAS_REGSLICE {4} \
   CONFIG.M08_HAS_REGSLICE {4} \
   CONFIG.M09_HAS_REGSLICE {4} \
   CONFIG.M10_HAS_REGSLICE {4} \
   CONFIG.M11_HAS_REGSLICE {4} \
   CONFIG.M12_HAS_REGSLICE {4} \
   CONFIG.M13_HAS_REGSLICE {4} \
   CONFIG.M14_HAS_REGSLICE {4} \
   CONFIG.M15_HAS_REGSLICE {4} \
   CONFIG.M16_HAS_REGSLICE {4} \
   CONFIG.M17_HAS_REGSLICE {4} \
   CONFIG.M18_HAS_REGSLICE {4} \
   CONFIG.M19_HAS_REGSLICE {4} \
   CONFIG.M20_HAS_REGSLICE {4} \
   CONFIG.M21_HAS_REGSLICE {4} \
   CONFIG.M22_HAS_REGSLICE {4} \
   CONFIG.M23_HAS_REGSLICE {4} \
   CONFIG.M24_HAS_REGSLICE {4} \
   CONFIG.M25_HAS_REGSLICE {4} \
   CONFIG.M26_HAS_REGSLICE {4} \
   CONFIG.M27_HAS_REGSLICE {4} \
   CONFIG.M28_HAS_REGSLICE {4} \
   CONFIG.M29_HAS_REGSLICE {4} \
   CONFIG.M30_HAS_REGSLICE {4} \
   CONFIG.M31_HAS_REGSLICE {4} \
   CONFIG.M32_HAS_REGSLICE {4} \
   CONFIG.M33_HAS_REGSLICE {4} \
   CONFIG.M34_HAS_REGSLICE {4} \
   CONFIG.M35_HAS_REGSLICE {4} \
   CONFIG.M36_HAS_REGSLICE {4} \
   CONFIG.M37_HAS_REGSLICE {4} \
   CONFIG.M38_HAS_REGSLICE {4} \
   CONFIG.M39_HAS_REGSLICE {4} \
   CONFIG.M40_HAS_REGSLICE {4} \
   CONFIG.M41_HAS_REGSLICE {4} \
   CONFIG.M42_HAS_REGSLICE {4} \
   CONFIG.M43_HAS_REGSLICE {4} \
   CONFIG.M44_HAS_REGSLICE {4} \
   CONFIG.M45_HAS_REGSLICE {4} \
   CONFIG.M46_HAS_REGSLICE {4} \
   CONFIG.M47_HAS_REGSLICE {4} \
   CONFIG.M48_HAS_REGSLICE {4} \
   CONFIG.M49_HAS_REGSLICE {4} \
   CONFIG.M50_HAS_REGSLICE {4} \
   CONFIG.M51_HAS_REGSLICE {4} \
   CONFIG.M52_HAS_REGSLICE {4} \
   CONFIG.M53_HAS_REGSLICE {4} \
   CONFIG.M54_HAS_REGSLICE {4} \
   CONFIG.M55_HAS_REGSLICE {4} \
   CONFIG.M56_HAS_REGSLICE {4} \
   CONFIG.M57_HAS_REGSLICE {4} \
   CONFIG.M58_HAS_REGSLICE {4} \
   CONFIG.M59_HAS_REGSLICE {4} \
   CONFIG.M60_HAS_REGSLICE {4} \
   CONFIG.M61_HAS_REGSLICE {4} \
   CONFIG.M62_HAS_REGSLICE {4} \
   CONFIG.M63_HAS_REGSLICE {4} \
   CONFIG.NUM_MI {1} \
   CONFIG.S00_HAS_REGSLICE {4} \
 ] $axi_interconnect_hpm0fpd
  set_property HDL_ATTRIBUTE.DPA_TRACE_MASTER {true} [get_bd_cells axi_interconnect_hpm0fpd]

  # Create instance: axi_mmu_2, and set properties
  set axi_mmu_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_mmu:2.1 axi_mmu_2 ]
  set_property -dict [ list \
   CONFIG.D000_ADDR_WIDTH {32} \
   CONFIG.ID_WIDTH {6} \
 ] $axi_mmu_2

  # Create instance: axi_mmu_3, and set properties
  set axi_mmu_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_mmu:2.1 axi_mmu_3 ]
  set_property -dict [ list \
   CONFIG.D000_ADDR_WIDTH {32} \
   CONFIG.ID_WIDTH {6} \
 ] $axi_mmu_3

  # Create instance: axi_mmu_4, and set properties
  set axi_mmu_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_mmu:2.1 axi_mmu_4 ]
  set_property -dict [ list \
   CONFIG.D000_ADDR_WIDTH {32} \
   CONFIG.ID_WIDTH {6} \
 ] $axi_mmu_4

  # Create instance: axi_mmu_5, and set properties
  set axi_mmu_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_mmu:2.1 axi_mmu_5 ]
  set_property -dict [ list \
   CONFIG.D000_ADDR_WIDTH {32} \
   CONFIG.ID_WIDTH {6} \
 ] $axi_mmu_5

  # Create instance: axi_register_slice_hpm0fpd, and set properties
  set axi_register_slice_hpm0fpd [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_hpm0fpd ]
  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
 ] $axi_register_slice_hpm0fpd

  # Create instance: axi_vip_0, and set properties
  set axi_vip_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_0 ]
  set_property -dict [ list \
   CONFIG.INTERFACE_MODE {SLAVE} \
 ] $axi_vip_0

  # Create instance: axi_vip_2, and set properties
  set axi_vip_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_2 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {1} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.INTERFACE_MODE {MASTER} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
 ] $axi_vip_2

  # Create instance: axi_vip_3, and set properties
  set axi_vip_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_3 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {1} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.INTERFACE_MODE {MASTER} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
 ] $axi_vip_3

  # Create instance: axi_vip_4, and set properties
  set axi_vip_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_4 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {1} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.INTERFACE_MODE {MASTER} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
 ] $axi_vip_4

  # Create instance: axi_vip_5, and set properties
  set axi_vip_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_5 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {1} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.INTERFACE_MODE {MASTER} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
 ] $axi_vip_5

  # Create instance: axi_vip_ctrl_userpf, and set properties
  set axi_vip_ctrl_userpf [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_ctrl_userpf ]

  # Create instance: axi_vip_hpm0fpd, and set properties
  set axi_vip_hpm0fpd [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_hpm0fpd ]

  # Create instance: debug_bridge_xsdbm, and set properties
  set debug_bridge_xsdbm [ create_bd_cell -type ip -vlnv xilinx.com:ip:debug_bridge:3.0 debug_bridge_xsdbm ]
  set_property -dict [ list \
   CONFIG.C_DEBUG_MODE {1} \
   CONFIG.C_DESIGN_TYPE {1} \
   CONFIG.C_ENABLE_CLK_DIVIDER {false} \
 ] $debug_bridge_xsdbm

  # Create instance: interconnect_axifull_1_user_slr1, and set properties
  set interconnect_axifull_1_user_slr1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 interconnect_axifull_1_user_slr1 ]
  set_property -dict [ list \
   CONFIG.M00_HAS_REGSLICE {4} \
   CONFIG.M01_HAS_REGSLICE {4} \
   CONFIG.M02_HAS_REGSLICE {4} \
   CONFIG.M03_HAS_REGSLICE {4} \
   CONFIG.M04_HAS_REGSLICE {4} \
   CONFIG.M05_HAS_REGSLICE {4} \
   CONFIG.M06_HAS_REGSLICE {4} \
   CONFIG.M07_HAS_REGSLICE {4} \
   CONFIG.M08_HAS_REGSLICE {4} \
   CONFIG.M09_HAS_REGSLICE {4} \
   CONFIG.M10_HAS_REGSLICE {4} \
   CONFIG.M11_HAS_REGSLICE {4} \
   CONFIG.M12_HAS_REGSLICE {4} \
   CONFIG.M13_HAS_REGSLICE {4} \
   CONFIG.M14_HAS_REGSLICE {4} \
   CONFIG.M15_HAS_REGSLICE {4} \
   CONFIG.M16_HAS_REGSLICE {4} \
   CONFIG.M17_HAS_REGSLICE {4} \
   CONFIG.M18_HAS_REGSLICE {4} \
   CONFIG.M19_HAS_REGSLICE {4} \
   CONFIG.M20_HAS_REGSLICE {4} \
   CONFIG.M21_HAS_REGSLICE {4} \
   CONFIG.M22_HAS_REGSLICE {4} \
   CONFIG.M23_HAS_REGSLICE {4} \
   CONFIG.M24_HAS_REGSLICE {4} \
   CONFIG.M25_HAS_REGSLICE {4} \
   CONFIG.M26_HAS_REGSLICE {4} \
   CONFIG.M27_HAS_REGSLICE {4} \
   CONFIG.M28_HAS_REGSLICE {4} \
   CONFIG.M29_HAS_REGSLICE {4} \
   CONFIG.M30_HAS_REGSLICE {4} \
   CONFIG.M31_HAS_REGSLICE {4} \
   CONFIG.M32_HAS_REGSLICE {4} \
   CONFIG.M33_HAS_REGSLICE {4} \
   CONFIG.M34_HAS_REGSLICE {4} \
   CONFIG.M35_HAS_REGSLICE {4} \
   CONFIG.M36_HAS_REGSLICE {4} \
   CONFIG.M37_HAS_REGSLICE {4} \
   CONFIG.M38_HAS_REGSLICE {4} \
   CONFIG.M39_HAS_REGSLICE {4} \
   CONFIG.M40_HAS_REGSLICE {4} \
   CONFIG.M41_HAS_REGSLICE {4} \
   CONFIG.M42_HAS_REGSLICE {4} \
   CONFIG.M43_HAS_REGSLICE {4} \
   CONFIG.M44_HAS_REGSLICE {4} \
   CONFIG.M45_HAS_REGSLICE {4} \
   CONFIG.M46_HAS_REGSLICE {4} \
   CONFIG.M47_HAS_REGSLICE {4} \
   CONFIG.M48_HAS_REGSLICE {4} \
   CONFIG.M49_HAS_REGSLICE {4} \
   CONFIG.M50_HAS_REGSLICE {4} \
   CONFIG.M51_HAS_REGSLICE {4} \
   CONFIG.M52_HAS_REGSLICE {4} \
   CONFIG.M53_HAS_REGSLICE {4} \
   CONFIG.M54_HAS_REGSLICE {4} \
   CONFIG.M55_HAS_REGSLICE {4} \
   CONFIG.M56_HAS_REGSLICE {4} \
   CONFIG.M57_HAS_REGSLICE {4} \
   CONFIG.M58_HAS_REGSLICE {4} \
   CONFIG.M59_HAS_REGSLICE {4} \
   CONFIG.M60_HAS_REGSLICE {4} \
   CONFIG.M61_HAS_REGSLICE {4} \
   CONFIG.M62_HAS_REGSLICE {4} \
   CONFIG.M63_HAS_REGSLICE {4} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
   CONFIG.S00_HAS_REGSLICE {4} \
 ] $interconnect_axifull_1_user_slr1

  # Create instance: interconnect_axifull_2_user_slr1, and set properties
  set interconnect_axifull_2_user_slr1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 interconnect_axifull_2_user_slr1 ]
  set_property -dict [ list \
   CONFIG.M00_HAS_REGSLICE {4} \
   CONFIG.M01_HAS_REGSLICE {4} \
   CONFIG.M02_HAS_REGSLICE {4} \
   CONFIG.M03_HAS_REGSLICE {4} \
   CONFIG.M04_HAS_REGSLICE {4} \
   CONFIG.M05_HAS_REGSLICE {4} \
   CONFIG.M06_HAS_REGSLICE {4} \
   CONFIG.M07_HAS_REGSLICE {4} \
   CONFIG.M08_HAS_REGSLICE {4} \
   CONFIG.M09_HAS_REGSLICE {4} \
   CONFIG.M10_HAS_REGSLICE {4} \
   CONFIG.M11_HAS_REGSLICE {4} \
   CONFIG.M12_HAS_REGSLICE {4} \
   CONFIG.M13_HAS_REGSLICE {4} \
   CONFIG.M14_HAS_REGSLICE {4} \
   CONFIG.M15_HAS_REGSLICE {4} \
   CONFIG.M16_HAS_REGSLICE {4} \
   CONFIG.M17_HAS_REGSLICE {4} \
   CONFIG.M18_HAS_REGSLICE {4} \
   CONFIG.M19_HAS_REGSLICE {4} \
   CONFIG.M20_HAS_REGSLICE {4} \
   CONFIG.M21_HAS_REGSLICE {4} \
   CONFIG.M22_HAS_REGSLICE {4} \
   CONFIG.M23_HAS_REGSLICE {4} \
   CONFIG.M24_HAS_REGSLICE {4} \
   CONFIG.M25_HAS_REGSLICE {4} \
   CONFIG.M26_HAS_REGSLICE {4} \
   CONFIG.M27_HAS_REGSLICE {4} \
   CONFIG.M28_HAS_REGSLICE {4} \
   CONFIG.M29_HAS_REGSLICE {4} \
   CONFIG.M30_HAS_REGSLICE {4} \
   CONFIG.M31_HAS_REGSLICE {4} \
   CONFIG.M32_HAS_REGSLICE {4} \
   CONFIG.M33_HAS_REGSLICE {4} \
   CONFIG.M34_HAS_REGSLICE {4} \
   CONFIG.M35_HAS_REGSLICE {4} \
   CONFIG.M36_HAS_REGSLICE {4} \
   CONFIG.M37_HAS_REGSLICE {4} \
   CONFIG.M38_HAS_REGSLICE {4} \
   CONFIG.M39_HAS_REGSLICE {4} \
   CONFIG.M40_HAS_REGSLICE {4} \
   CONFIG.M41_HAS_REGSLICE {4} \
   CONFIG.M42_HAS_REGSLICE {4} \
   CONFIG.M43_HAS_REGSLICE {4} \
   CONFIG.M44_HAS_REGSLICE {4} \
   CONFIG.M45_HAS_REGSLICE {4} \
   CONFIG.M46_HAS_REGSLICE {4} \
   CONFIG.M47_HAS_REGSLICE {4} \
   CONFIG.M48_HAS_REGSLICE {4} \
   CONFIG.M49_HAS_REGSLICE {4} \
   CONFIG.M50_HAS_REGSLICE {4} \
   CONFIG.M51_HAS_REGSLICE {4} \
   CONFIG.M52_HAS_REGSLICE {4} \
   CONFIG.M53_HAS_REGSLICE {4} \
   CONFIG.M54_HAS_REGSLICE {4} \
   CONFIG.M55_HAS_REGSLICE {4} \
   CONFIG.M56_HAS_REGSLICE {4} \
   CONFIG.M57_HAS_REGSLICE {4} \
   CONFIG.M58_HAS_REGSLICE {4} \
   CONFIG.M59_HAS_REGSLICE {4} \
   CONFIG.M60_HAS_REGSLICE {4} \
   CONFIG.M61_HAS_REGSLICE {4} \
   CONFIG.M62_HAS_REGSLICE {4} \
   CONFIG.M63_HAS_REGSLICE {4} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
   CONFIG.S00_HAS_REGSLICE {4} \
 ] $interconnect_axifull_2_user_slr1
  set_property HDL_ATTRIBUTE.DPA_TRACE_SLAVE {true} [get_bd_cells interconnect_axifull_2_user_slr1]

  # Create instance: interconnect_axilite_user_slr1, and set properties
  set interconnect_axilite_user_slr1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 interconnect_axilite_user_slr1 ]
  set_property -dict [ list \
   CONFIG.M00_HAS_REGSLICE {4} \
   CONFIG.M01_HAS_REGSLICE {4} \
   CONFIG.M02_HAS_REGSLICE {4} \
   CONFIG.M03_HAS_REGSLICE {4} \
   CONFIG.M04_HAS_REGSLICE {4} \
   CONFIG.M05_HAS_REGSLICE {4} \
   CONFIG.M06_HAS_REGSLICE {4} \
   CONFIG.M07_HAS_REGSLICE {4} \
   CONFIG.M08_HAS_REGSLICE {4} \
   CONFIG.M09_HAS_REGSLICE {4} \
   CONFIG.M10_HAS_REGSLICE {4} \
   CONFIG.M11_HAS_REGSLICE {4} \
   CONFIG.M12_HAS_REGSLICE {4} \
   CONFIG.M13_HAS_REGSLICE {4} \
   CONFIG.M14_HAS_REGSLICE {4} \
   CONFIG.M15_HAS_REGSLICE {4} \
   CONFIG.M16_HAS_REGSLICE {4} \
   CONFIG.M17_HAS_REGSLICE {4} \
   CONFIG.M18_HAS_REGSLICE {4} \
   CONFIG.M19_HAS_REGSLICE {4} \
   CONFIG.M20_HAS_REGSLICE {4} \
   CONFIG.M21_HAS_REGSLICE {4} \
   CONFIG.M22_HAS_REGSLICE {4} \
   CONFIG.M23_HAS_REGSLICE {4} \
   CONFIG.M24_HAS_REGSLICE {4} \
   CONFIG.M25_HAS_REGSLICE {4} \
   CONFIG.M26_HAS_REGSLICE {4} \
   CONFIG.M27_HAS_REGSLICE {4} \
   CONFIG.M28_HAS_REGSLICE {4} \
   CONFIG.M29_HAS_REGSLICE {4} \
   CONFIG.M30_HAS_REGSLICE {4} \
   CONFIG.M31_HAS_REGSLICE {4} \
   CONFIG.M32_HAS_REGSLICE {4} \
   CONFIG.M33_HAS_REGSLICE {4} \
   CONFIG.M34_HAS_REGSLICE {4} \
   CONFIG.M35_HAS_REGSLICE {4} \
   CONFIG.M36_HAS_REGSLICE {4} \
   CONFIG.M37_HAS_REGSLICE {4} \
   CONFIG.M38_HAS_REGSLICE {4} \
   CONFIG.M39_HAS_REGSLICE {4} \
   CONFIG.M40_HAS_REGSLICE {4} \
   CONFIG.M41_HAS_REGSLICE {4} \
   CONFIG.M42_HAS_REGSLICE {4} \
   CONFIG.M43_HAS_REGSLICE {4} \
   CONFIG.M44_HAS_REGSLICE {4} \
   CONFIG.M45_HAS_REGSLICE {4} \
   CONFIG.M46_HAS_REGSLICE {4} \
   CONFIG.M47_HAS_REGSLICE {4} \
   CONFIG.M48_HAS_REGSLICE {4} \
   CONFIG.M49_HAS_REGSLICE {4} \
   CONFIG.M50_HAS_REGSLICE {4} \
   CONFIG.M51_HAS_REGSLICE {4} \
   CONFIG.M52_HAS_REGSLICE {4} \
   CONFIG.M53_HAS_REGSLICE {4} \
   CONFIG.M54_HAS_REGSLICE {4} \
   CONFIG.M55_HAS_REGSLICE {4} \
   CONFIG.M56_HAS_REGSLICE {4} \
   CONFIG.M57_HAS_REGSLICE {4} \
   CONFIG.M58_HAS_REGSLICE {4} \
   CONFIG.M59_HAS_REGSLICE {4} \
   CONFIG.M60_HAS_REGSLICE {4} \
   CONFIG.M61_HAS_REGSLICE {4} \
   CONFIG.M62_HAS_REGSLICE {4} \
   CONFIG.M63_HAS_REGSLICE {4} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
   CONFIG.S00_HAS_REGSLICE {4} \
 ] $interconnect_axilite_user_slr1
  set_property HDL_ATTRIBUTE.DPA_AXILITE_MASTER {fallback} [get_bd_cells interconnect_axilite_user_slr1]

  # Create instance: interrupt_concat
  create_hier_cell_interrupt_concat [current_bd_instance .] interrupt_concat

  # Create instance: reset_controllers
  create_hier_cell_reset_controllers [current_bd_instance .] reset_controllers

  # Create interface connections
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_hpm0fpd/M00_AXI] [get_bd_intf_pins axi_register_slice_hpm0fpd/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI1 [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins axi_mmu_4/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins axi_mmu_5/S_AXI]
  connect_bd_intf_net -intf_net axi_mmu_0_M_AXI [get_bd_intf_ports interconnect_aximm_ddrmem3_M00_AXI] [get_bd_intf_pins axi_mmu_3/M_AXI]
  connect_bd_intf_net -intf_net axi_mmu_2_M_AXI [get_bd_intf_ports interconnect_aximm_ddrmem2_M00_AXI] [get_bd_intf_pins axi_mmu_2/M_AXI]
  connect_bd_intf_net -intf_net axi_mmu_4_M_AXI [get_bd_intf_ports interconnect_aximm_ddrmem4_M00_AXI] [get_bd_intf_pins axi_mmu_4/M_AXI]
  connect_bd_intf_net -intf_net axi_mmu_5_M_AXI [get_bd_intf_ports interconnect_aximm_ddrmem5_M00_AXI] [get_bd_intf_pins axi_mmu_5/M_AXI]
  connect_bd_intf_net -intf_net axi_register_slice_hpm0fpd_M_AXI [get_bd_intf_pins axi_register_slice_hpm0fpd/M_AXI] [get_bd_intf_pins axi_vip_0/S_AXI]
  connect_bd_intf_net -intf_net axi_vip_1_M_AXI [get_bd_intf_pins axi_interconnect_hpm0fpd/S00_AXI] [get_bd_intf_pins axi_vip_hpm0fpd/M_AXI]
  connect_bd_intf_net -intf_net axi_vip_2_M_AXI [get_bd_intf_pins axi_vip_2/M_AXI] [get_bd_intf_pins interconnect_axifull_1_user_slr1/S00_AXI]
  connect_bd_intf_net -intf_net axi_vip_3_M_AXI [get_bd_intf_pins axi_vip_3/M_AXI] [get_bd_intf_pins interconnect_axifull_2_user_slr1/S00_AXI]
  connect_bd_intf_net -intf_net axi_vip_4_M_AXI [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins axi_vip_4/M_AXI]
  connect_bd_intf_net -intf_net axi_vip_5_M_AXI [get_bd_intf_pins axi_interconnect_1/S00_AXI] [get_bd_intf_pins axi_vip_5/M_AXI]
  connect_bd_intf_net -intf_net axi_vip_ctrl_userpf_M_AXI [get_bd_intf_pins axi_vip_ctrl_userpf/M_AXI] [get_bd_intf_pins interconnect_axilite_user_slr1/S00_AXI]
  connect_bd_intf_net -intf_net interconnect_axifull_1_user_slr1_M00_AXI [get_bd_intf_pins axi_mmu_2/S_AXI] [get_bd_intf_pins interconnect_axifull_1_user_slr1/M00_AXI]
  connect_bd_intf_net -intf_net interconnect_axifull_2_user_slr1_M00_AXI [get_bd_intf_pins axi_mmu_3/S_AXI] [get_bd_intf_pins interconnect_axifull_2_user_slr1/M00_AXI]
  connect_bd_intf_net -intf_net interconnect_axilite_user_M00_AXI [get_bd_intf_pins axi_gpio_null/S_AXI] [get_bd_intf_pins interconnect_axilite_user_slr1/M00_AXI]
  connect_bd_intf_net -intf_net regslice_control_userpf_M_AXI_1 [get_bd_intf_ports regslice_control_userpf_M_AXI] [get_bd_intf_pins axi_vip_ctrl_userpf/S_AXI]
  connect_bd_intf_net -intf_net regslice_data_hpm0fpd_M_AXI1_1 [get_bd_intf_ports regslice_data_hpm0fpd_M_AXI1] [get_bd_intf_pins axi_vip_hpm0fpd/S_AXI]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_gpio_null/s_axi_aresetn] [get_bd_pins interconnect_axilite_user_slr1/ARESETN] [get_bd_pins interconnect_axilite_user_slr1/M00_ARESETN] [get_bd_pins interconnect_axilite_user_slr1/S00_ARESETN] [get_bd_pins reset_controllers/psreset_gate_pr_control_interconnect_aresetn]
  connect_bd_net -net M01_ACLK_1 [get_bd_ports clkwiz_kernel2_clk_out1] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axi_interconnect_hpm0fpd/ACLK] [get_bd_pins axi_interconnect_hpm0fpd/M00_ACLK] [get_bd_pins axi_interconnect_hpm0fpd/S00_ACLK] [get_bd_pins axi_mmu_2/aclk] [get_bd_pins axi_mmu_3/aclk] [get_bd_pins axi_mmu_4/aclk] [get_bd_pins axi_mmu_5/aclk] [get_bd_pins axi_register_slice_hpm0fpd/aclk] [get_bd_pins axi_vip_0/aclk] [get_bd_pins axi_vip_2/aclk] [get_bd_pins axi_vip_3/aclk] [get_bd_pins axi_vip_4/aclk] [get_bd_pins axi_vip_5/aclk] [get_bd_pins axi_vip_hpm0fpd/aclk] [get_bd_pins interconnect_axifull_1_user_slr1/ACLK] [get_bd_pins interconnect_axifull_1_user_slr1/M00_ACLK] [get_bd_pins interconnect_axifull_1_user_slr1/S00_ACLK] [get_bd_pins interconnect_axifull_2_user_slr1/ACLK] [get_bd_pins interconnect_axifull_2_user_slr1/M00_ACLK] [get_bd_pins interconnect_axifull_2_user_slr1/S00_ACLK] [get_bd_pins reset_controllers/clkwiz_kernel2_clk_out1]
  connect_bd_net -net bscanid_en_1 [get_bd_ports bscanid_en] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_bscanid_en]
  connect_bd_net -net capture_1 [get_bd_ports capture] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_capture]
  connect_bd_net -net clkwiz_kernel3_clk_out_1 [get_bd_ports clkwiz_kernel3_clk_out] [get_bd_pins reset_controllers/clkwiz_kernel3_clk_out]
  connect_bd_net -net clkwiz_kernel4_clk_out_1 [get_bd_ports clkwiz_kernel4_clk_out] [get_bd_pins reset_controllers/clkwiz_kernel4_clk_out]
  connect_bd_net -net clkwiz_kernel5_clk_out_1 [get_bd_ports clkwiz_kernel5_clk_out] [get_bd_pins reset_controllers/clkwiz_kernel5_clk_out]
  connect_bd_net -net clkwiz_kernel6_clk_out_1 [get_bd_ports clkwiz_kernel6_clk_out] [get_bd_pins reset_controllers/clkwiz_kernel6_clk_out]
  connect_bd_net -net dcm_locked_1 [get_bd_ports clkwiz_kernel_locked] [get_bd_pins reset_controllers/clkwiz_kernel_locked]
  connect_bd_net -net dcm_locked_3 [get_bd_ports clkwiz_kernel2_locked] [get_bd_pins reset_controllers/clkwiz_kernel2_locked]
  connect_bd_net -net debug_bridge_xsdbm_S_BSCAN_tdo [get_bd_ports tdo] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_tdo]
  connect_bd_net -net drck_1 [get_bd_ports drck] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_drck]
  connect_bd_net -net expanded_resets_interconnect_aresetn1 [get_bd_pins axi_vip_ctrl_userpf/aresetn] [get_bd_pins reset_controllers/psreset_gate_pr_control_peripheral_aresetn]
  connect_bd_net -net ext_reset_in_1 [get_bd_ports pr_reset_n] [get_bd_pins reset_controllers/slice_reset_kernel_pr_Dout]
  connect_bd_net -net interrupt_concat_xlconcat_interrupt_dout [get_bd_ports xlconcat_interrupt_dout] [get_bd_pins interrupt_concat/xlconcat_interrupt_dout]
  connect_bd_net -net logic_reset_op_Res_1 [get_bd_ports clkwiz_sysclks_locked] [get_bd_pins reset_controllers/clkwiz_sysclks_locked]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_reset]
  connect_bd_net -net reset_controllers_interconnect_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axi_interconnect_hpm0fpd/ARESETN] [get_bd_pins axi_interconnect_hpm0fpd/M00_ARESETN] [get_bd_pins axi_interconnect_hpm0fpd/S00_ARESETN] [get_bd_pins axi_mmu_2/aresetn] [get_bd_pins axi_mmu_3/aresetn] [get_bd_pins axi_mmu_4/aresetn] [get_bd_pins axi_mmu_5/aresetn] [get_bd_pins axi_register_slice_hpm0fpd/aresetn] [get_bd_pins axi_vip_0/aresetn] [get_bd_pins axi_vip_2/aresetn] [get_bd_pins axi_vip_3/aresetn] [get_bd_pins axi_vip_4/aresetn] [get_bd_pins axi_vip_5/aresetn] [get_bd_pins axi_vip_hpm0fpd/aresetn] [get_bd_pins interconnect_axifull_1_user_slr1/ARESETN] [get_bd_pins interconnect_axifull_1_user_slr1/M00_ARESETN] [get_bd_pins interconnect_axifull_1_user_slr1/S00_ARESETN] [get_bd_pins interconnect_axifull_2_user_slr1/ARESETN] [get_bd_pins interconnect_axifull_2_user_slr1/M00_ARESETN] [get_bd_pins interconnect_axifull_2_user_slr1/S00_ARESETN] [get_bd_pins reset_controllers/psreset_gate_pr_kernel2_interconnect_aresetn_0]
  connect_bd_net -net runtest_1 [get_bd_ports runtest] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_runtest]
  connect_bd_net -net sel_1 [get_bd_ports sel] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_sel]
  connect_bd_net -net shift_1 [get_bd_ports shift] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_shift]
  connect_bd_net -net slowest_sync_clk_1 [get_bd_ports clkwiz_sysclks_clk_out2] [get_bd_pins axi_gpio_null/s_axi_aclk] [get_bd_pins axi_vip_ctrl_userpf/aclk] [get_bd_pins debug_bridge_xsdbm/clk] [get_bd_pins interconnect_axilite_user_slr1/ACLK] [get_bd_pins interconnect_axilite_user_slr1/M00_ACLK] [get_bd_pins interconnect_axilite_user_slr1/S00_ACLK] [get_bd_pins reset_controllers/clkwiz_sysclks_clk_out2]
  connect_bd_net -net slowest_sync_clk_3 [get_bd_ports clkwiz_kernel_clk_out1] [get_bd_pins reset_controllers/clkwiz_kernel_clk_out1]
  connect_bd_net -net tck_1 [get_bd_ports tck] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_tck]
  connect_bd_net -net tdi_1 [get_bd_ports tdi] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_tdi]
  connect_bd_net -net tms_1 [get_bd_ports tms] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_tms]
  connect_bd_net -net update_1 [get_bd_ports update] [get_bd_pins debug_bridge_xsdbm/S_BSCAN_update]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_vip_2/Master_AXI] [get_bd_addr_segs interconnect_aximm_ddrmem2_M00_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_vip_3/Master_AXI] [get_bd_addr_segs interconnect_aximm_ddrmem3_M00_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_vip_4/Master_AXI] [get_bd_addr_segs interconnect_aximm_ddrmem4_M00_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_vip_5/Master_AXI] [get_bd_addr_segs interconnect_aximm_ddrmem5_M00_AXI/Reg] -force
  assign_bd_address -offset 0x80800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces regslice_control_userpf_M_AXI] [get_bd_addr_segs axi_gpio_null/S_AXI/Reg] -force
  assign_bd_address -offset 0xA0000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces regslice_data_hpm0fpd_M_AXI1] [get_bd_addr_segs axi_vip_0/S_AXI/Reg] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  # Create PFM attributes
  set_property PFM_NAME {xilinx:xd:xilinx_zcu102_dynamic_5_1:5.1} [get_files [current_bd_design].bd]
  set_property PFM.CLOCK {clkwiz_kernel2_clk_out1 {id "1" is_default "false" proc_sys_reset "reset_controllers/psreset_gate_pr_kernel2"  status "fixed"}  } [get_bd_ports /clkwiz_kernel2_clk_out1]
  set_property PFM.CLOCK {clkwiz_kernel3_clk_out {id "3" is_default "false" proc_sys_reset "/reset_controllers/psreset_gate_pr_kernel3" status "fixed"}  } [get_bd_ports /clkwiz_kernel3_clk_out]
  set_property PFM.CLOCK {clkwiz_kernel4_clk_out {id "4" is_default "false" proc_sys_reset "/reset_controllers/psreset_gate_pr_kernel4" status "fixed"}  } [get_bd_ports /clkwiz_kernel4_clk_out]
  set_property PFM.CLOCK {clkwiz_kernel5_clk_out {id "5" is_default "false" proc_sys_reset "/reset_controllers/psreset_gate_pr_kernel6" status "fixed"}  } [get_bd_ports /clkwiz_kernel5_clk_out]
  set_property PFM.CLOCK {clkwiz_kernel6_clk_out {id "6" is_default "false" proc_sys_reset "/reset_controllers/psreset_gate_pr_kernel5" status "fixed"}  } [get_bd_ports /clkwiz_kernel6_clk_out]
  set_property PFM.CLOCK {clkwiz_kernel_clk_out1 {id "0" is_default "true" proc_sys_reset "reset_controllers/psreset_gate_pr_kernel"  status "fixed"}  } [get_bd_ports /clkwiz_kernel_clk_out1]
  set_property PFM.CLOCK {clkwiz_sysclks_clk_out2 {id "2" is_default "false" proc_sys_reset "/reset_controllers/psreset_gate_pr_control" status "fixed"}  } [get_bd_ports /clkwiz_sysclks_clk_out2]
  set_property PFM.AXI_PORT {S01_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S02_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S03_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S04_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S05_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S06_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S07_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S08_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S09_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S10_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S11_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S12_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S13_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S14_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"} S15_AXI {memport "S_AXI_HP" sptag "HP1" memory "interconnect_aximm_ddrmem4_M00_AXI Reg"}} [get_bd_cells /axi_interconnect_0]
  set_property PFM.AXI_PORT {S01_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S02_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S03_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S04_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S05_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S06_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S07_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S08_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S09_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S10_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S11_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S12_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S13_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S14_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"} S15_AXI {memport "S_AXI_HP" sptag "HP2" memory "interconnect_aximm_ddrmem5_M00_AXI Reg"}} [get_bd_cells /axi_interconnect_1]
  set_property PFM.AXI_PORT {S01_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S02_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S03_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S04_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S05_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S06_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S07_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S08_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S09_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S10_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S11_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S12_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S13_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S14_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"} S15_AXI {memport "S_AXI_HP" sptag "HP3" memory "interconnect_aximm_ddrmem2_M00_AXI Reg"}} [get_bd_cells /interconnect_axifull_1_user_slr1]
  set_property PFM.AXI_PORT {S01_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S02_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S03_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S04_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S05_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S06_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S07_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S08_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S09_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S10_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S11_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S12_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S13_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S14_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"} S15_AXI {memport "S_AXI_HP" sptag "HP0" memory "interconnect_aximm_ddrmem3_M00_AXI Reg"}} [get_bd_cells /interconnect_axifull_2_user_slr1]
  set_property PFM.AXI_PORT {M01_AXI {memport "M_AXI_GP"} M02_AXI {memport "M_AXI_GP"} M03_AXI {memport "M_AXI_GP"} M04_AXI {memport "M_AXI_GP"} M05_AXI {memport "M_AXI_GP"} M06_AXI {memport "M_AXI_GP"} M07_AXI {memport "M_AXI_GP"} M08_AXI {memport "M_AXI_GP"} M09_AXI {memport "M_AXI_GP"} M10_AXI {memport "M_AXI_GP"} M11_AXI {memport "M_AXI_GP"} M12_AXI {memport "M_AXI_GP"} M13_AXI {memport "M_AXI_GP"} M14_AXI {memport "M_AXI_GP"} M15_AXI {memport "M_AXI_GP"} M16_AXI {memport "M_AXI_GP"} M17_AXI {memport "M_AXI_GP"} M18_AXI {memport "M_AXI_GP"} M19_AXI {memport "M_AXI_GP"} M20_AXI {memport "M_AXI_GP"} M21_AXI {memport "M_AXI_GP"} M22_AXI {memport "M_AXI_GP"} M23_AXI {memport "M_AXI_GP"} M24_AXI {memport "M_AXI_GP"} M25_AXI {memport "M_AXI_GP"} M26_AXI {memport "M_AXI_GP"} M27_AXI {memport "M_AXI_GP"} M28_AXI {memport "M_AXI_GP"} M29_AXI {memport "M_AXI_GP"} M30_AXI {memport "M_AXI_GP"} M31_AXI {memport "M_AXI_GP"} M32_AXI {memport "M_AXI_GP"} M33_AXI {memport "M_AXI_GP"} M34_AXI {memport "M_AXI_GP"} M35_AXI {memport "M_AXI_GP"} M36_AXI {memport "M_AXI_GP"} M37_AXI {memport "M_AXI_GP"} M38_AXI {memport "M_AXI_GP"} M39_AXI {memport "M_AXI_GP"} M40_AXI {memport "M_AXI_GP"} M41_AXI {memport "M_AXI_GP"} M42_AXI {memport "M_AXI_GP"} M43_AXI {memport "M_AXI_GP"} M44_AXI {memport "M_AXI_GP"} M45_AXI {memport "M_AXI_GP"} M46_AXI {memport "M_AXI_GP"} M47_AXI {memport "M_AXI_GP"} M48_AXI {memport "M_AXI_GP"} M49_AXI {memport "M_AXI_GP"} M50_AXI {memport "M_AXI_GP"} M51_AXI {memport "M_AXI_GP"} M52_AXI {memport "M_AXI_GP"} M53_AXI {memport "M_AXI_GP"} M54_AXI {memport "M_AXI_GP"} M55_AXI {memport "M_AXI_GP"} M56_AXI {memport "M_AXI_GP"} M57_AXI {memport "M_AXI_GP"} M58_AXI {memport "M_AXI_GP"} M59_AXI {memport "M_AXI_GP"} M60_AXI {memport "M_AXI_GP"} M61_AXI {memport "M_AXI_GP"} M62_AXI {memport "M_AXI_GP"} M63_AXI {memport "M_AXI_GP"}} [get_bd_cells /interconnect_axilite_user_slr1]
  set_property PFM.IRQ {In0 {id 0} In1 {id 1} In2 {id 2} In3 {id 3} In4 {id 4} In5 {id 5} In6 {id 6} In7 {id 7} In8 {id 8} In9 {id 9} In10 {id 10} In11 {id 11} In12 {id 12} In13 {id 13} In14 {id 14} In15 {id 15} In16 {id 16} In17 {id 17} In18 {id 18} In19 {id 19} In20 {id 20} In21 {id 21} In22 {id 22} In23 {id 23} In24 {id 24} In25 {id 25} In26 {id 26} In27 {id 27} In28 {id 28} In29 {id 29} In30 {id 30} In31 {id 31}} [get_bd_cells /interrupt_concat/xlconcat_interrupt_0]


  validate_bd_design

  set_property HDL_ATTRIBUTE.LOCKED {true} [get_bd_intf_ports interconnect_aximm_ddrmem2_M00_AXI]
  set_property HDL_ATTRIBUTE.LOCKED {true} [get_bd_intf_ports interconnect_aximm_ddrmem3_M00_AXI]
  set_property HDL_ATTRIBUTE.LOCKED {true} [get_bd_intf_ports interconnect_aximm_ddrmem4_M00_AXI]
  set_property HDL_ATTRIBUTE.LOCKED {true} [get_bd_intf_ports interconnect_aximm_ddrmem5_M00_AXI]
  set_property HDL_ATTRIBUTE.LOCKED {true} [get_bd_intf_ports regslice_control_userpf_M_AXI]
  set_property HDL_ATTRIBUTE.LOCKED {true} [get_bd_intf_ports regslice_data_hpm0fpd_M_AXI1]

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


