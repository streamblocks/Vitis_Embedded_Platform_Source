# -------------------------------------------------------------------------
# Copyright 2019 Xilinx Inc. / EPFL VLSC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -------------------------------------------------------------------------
# Clock domain priority
# ------------------------------------------------------------------------------
set_property HIGH_PRIORITY true [get_nets pfm_top_i/static_region/base_clocking/clkwiz_sysclks/inst/clk_out1]
set_property HIGH_PRIORITY true [get_nets pfm_top_i/static_region/base_clocking/clkwiz_sysclks/inst/clk_out2]

# Additional timing constraints
# ------------------------------------------------------------------------------

# Programmable clock delay
create_property MAX_PROG_DELAY net

# Configuration
# ------------------------------------------------------------------------------
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable    [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE           [current_design]
####set_property CONFIG_MODE SPIx4                         [current_design]
####set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
####set_property BITSTREAM.CONFIG.CONFIGRATE 85.0          [current_design]
####set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup         [current_design]
####set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes       [current_design]

# IO constraints 
# ------------------------------------------------------------------------------
  
# Floorplanning
# ------------------------------------------------------------------------------
set_property DONT_TOUCH true [get_cells pfm_top_i/dynamic_region]
set_property HD.RECONFIGURABLE true [get_cells pfm_top_i/dynamic_region]

# Dynamic region pblock
create_pblock pblock_dynamic_region
add_cells_to_pblock [get_pblocks pblock_dynamic_region] [get_cells -quiet [list pfm_top_i/dynamic_region]]
resize_pblock [get_pblocks pblock_dynamic_region] -add {SLICE_X67Y0:SLICE_X88Y239 SLICE_X89Y0:SLICE_X111Y119 SLICE_X89Y120:SLICE_X98Y179 SLICE_X101Y120:SLICE_X111Y179 SLICE_X89Y180:SLICE_X111Y239 }
resize_pblock [get_pblocks pblock_dynamic_region] -add {CFGIO_SITE_X0Y0:CFGIO_SITE_X0Y0}
resize_pblock [get_pblocks pblock_dynamic_region] -add {DSP48E2_X7Y0:DSP48E2_X11Y95 DSP48E2_X12Y0:DSP48E2_X13Y47 DSP48E2_X12Y48:DSP48E2_X12Y95 DSP48E2_X13Y48:DSP48E2_X13Y95}
resize_pblock [get_pblocks pblock_dynamic_region] -add {IOB_X0Y0:IOB_X0Y37}
resize_pblock [get_pblocks pblock_dynamic_region] -add {RAMB18_X2Y0:RAMB18_X2Y95 RAMB18_X3Y0:RAMB18_X4Y47 RAMB18_X3Y48:RAMB18_X3Y71 RAMB18_X3Y72:RAMB18_X4Y95 RAMB18_X4Y48:RAMB18_X4Y71}
resize_pblock [get_pblocks pblock_dynamic_region] -add {RAMB36_X2Y0:RAMB36_X2Y47 RAMB36_X3Y0:RAMB36_X4Y23 RAMB36_X3Y24:RAMB36_X3Y35 RAMB36_X4Y24:RAMB36_X4Y35 RAMB36_X3Y36:RAMB36_X4Y47}
resize_pblock [get_pblocks pblock_dynamic_region] -add {SYSMONE4_X0Y0:SYSMONE4_X0Y0}
resize_pblock [get_pblocks pblock_dynamic_region] -add {CLOCKREGION_X0Y4:CLOCKREGION_X3Y5}
set_property SNAPPING_MODE ON [get_pblocks pblock_dynamic_region]


#To avoid placement of static cells in the island to help with timing enclosure
set_property PROHIBIT 1  [get_sites -range SLICE_X99Y120:SLICE_X99Y179]
set_property PROHIBIT 1  [get_sites -range SLICE_X100Y120:SLICE_X100Y179]
set_property PROHIBIT 1  [get_sites -range SLICE_X66Y0:SLICE_X66Y239] 

#revert back to original instance
current_instance -quiet

