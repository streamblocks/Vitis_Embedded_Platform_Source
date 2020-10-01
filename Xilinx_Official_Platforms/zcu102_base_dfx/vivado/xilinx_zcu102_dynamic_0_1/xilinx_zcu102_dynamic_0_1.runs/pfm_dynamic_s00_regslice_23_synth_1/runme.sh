#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/tools/Xilinx/Vitis/2020.1/bin:/tools/Xilinx/Vivado/2020.1/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2020.1/bin
else
  PATH=/tools/Xilinx/Vitis/2020.1/bin:/tools/Xilinx/Vivado/2020.1/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2020.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/endrix/git/streamblocks/Vitis_Embedded_Platform_Source/Xilinx_Official_Platforms/zcu102_base_dfx/vivado/xilinx_zcu102_dynamic_0_1/xilinx_zcu102_dynamic_0_1.runs/pfm_dynamic_s00_regslice_23_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log pfm_dynamic_s00_regslice_23.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source pfm_dynamic_s00_regslice_23.tcl
