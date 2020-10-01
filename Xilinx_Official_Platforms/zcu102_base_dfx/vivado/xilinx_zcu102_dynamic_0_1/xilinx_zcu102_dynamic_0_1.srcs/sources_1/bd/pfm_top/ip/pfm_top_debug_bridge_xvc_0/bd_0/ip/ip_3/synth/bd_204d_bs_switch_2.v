// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:bs_switch:1.0
// IP Revision: 0

(* X_CORE_INFO = "bs_switch_v1_0_0_bs_switch,Vivado 2020.1" *)
(* CHECK_LICENSE_TYPE = "bd_204d_bs_switch_2,bs_switch_v1_0_0_bs_switch,{}" *)
(* CORE_GENERATION_INFO = "bd_204d_bs_switch_2,bs_switch_v1_0_0_bs_switch,{x_ipProduct=Vivado 2020.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=bs_switch,x_ipVersion=1.0,x_ipCoreRevision=0,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_USE_EXT_BSCAN=0,C_ONLY_PRIMITIVE=0,C_NUM_BS_MASTER=2,C_XDEVICEFAMILY=zynquplus,C_USER_SCAN_CHAIN=1}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_204d_bs_switch_2 (
  drck_0,
  reset_0,
  sel_0,
  capture_0,
  shift_0,
  update_0,
  tdi_0,
  runtest_0,
  tck_0,
  tms_0,
  bscanid_en_0,
  tdo_0,
  drck_1,
  reset_1,
  sel_1,
  capture_1,
  shift_1,
  update_1,
  tdi_1,
  runtest_1,
  tck_1,
  tms_1,
  bscanid_en_1,
  tdo_1
);

(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan DRCK" *)
output wire drck_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan RESET" *)
output wire reset_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan SEL" *)
output wire sel_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan CAPTURE" *)
output wire capture_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan SHIFT" *)
output wire shift_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan UPDATE" *)
output wire update_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan TDI" *)
output wire tdi_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan RUNTEST" *)
output wire runtest_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan TCK" *)
output wire tck_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan TMS" *)
output wire tms_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan BSCANID_en" *)
output wire bscanid_en_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan TDO" *)
input wire tdo_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan DRCK" *)
output wire drck_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan RESET" *)
output wire reset_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan SEL" *)
output wire sel_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan CAPTURE" *)
output wire capture_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan SHIFT" *)
output wire shift_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan UPDATE" *)
output wire update_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan TDI" *)
output wire tdi_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan RUNTEST" *)
output wire runtest_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan TCK" *)
output wire tck_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan TMS" *)
output wire tms_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan BSCANID_en" *)
output wire bscanid_en_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m1_bscan TDO" *)
input wire tdo_1;

  bs_switch_v1_0_0_bs_switch #(
    .C_USE_EXT_BSCAN(0),
    .C_ONLY_PRIMITIVE(0),
    .C_NUM_BS_MASTER(2),
    .C_XDEVICEFAMILY("zynquplus"),
    .C_USER_SCAN_CHAIN(1)
  ) inst (
    .s_bscan_drck(1'B0),
    .s_bscan_reset(1'B0),
    .s_bscan_sel(1'B0),
    .s_bscan_capture(1'B0),
    .s_bscan_shift(1'B0),
    .s_bscan_update(1'B0),
    .s_bscan_tdi(1'B0),
    .s_bscan_runtest(1'B0),
    .s_bscan_tck(1'B0),
    .s_bscan_tms(1'B0),
    .s_bscanid_en(1'B0),
    .s_bscan_tdo(),
    .drck_0(drck_0),
    .reset_0(reset_0),
    .sel_0(sel_0),
    .capture_0(capture_0),
    .shift_0(shift_0),
    .update_0(update_0),
    .tdi_0(tdi_0),
    .runtest_0(runtest_0),
    .tck_0(tck_0),
    .tms_0(tms_0),
    .bscanid_en_0(bscanid_en_0),
    .tdo_0(tdo_0),
    .drck_1(drck_1),
    .reset_1(reset_1),
    .sel_1(sel_1),
    .capture_1(capture_1),
    .shift_1(shift_1),
    .update_1(update_1),
    .tdi_1(tdi_1),
    .runtest_1(runtest_1),
    .tck_1(tck_1),
    .tms_1(tms_1),
    .bscanid_en_1(bscanid_en_1),
    .tdo_1(tdo_1),
    .drck_2(),
    .reset_2(),
    .sel_2(),
    .capture_2(),
    .shift_2(),
    .update_2(),
    .tdi_2(),
    .runtest_2(),
    .tck_2(),
    .tms_2(),
    .bscanid_en_2(),
    .tdo_2(1'B0),
    .drck_3(),
    .reset_3(),
    .sel_3(),
    .capture_3(),
    .shift_3(),
    .update_3(),
    .tdi_3(),
    .runtest_3(),
    .tck_3(),
    .tms_3(),
    .bscanid_en_3(),
    .tdo_3(1'B0),
    .drck_4(),
    .reset_4(),
    .sel_4(),
    .capture_4(),
    .shift_4(),
    .update_4(),
    .tdi_4(),
    .runtest_4(),
    .tck_4(),
    .tms_4(),
    .bscanid_en_4(),
    .tdo_4(1'B0),
    .drck_5(),
    .reset_5(),
    .sel_5(),
    .capture_5(),
    .shift_5(),
    .update_5(),
    .tdi_5(),
    .runtest_5(),
    .tck_5(),
    .tms_5(),
    .bscanid_en_5(),
    .tdo_5(1'B0),
    .drck_6(),
    .reset_6(),
    .sel_6(),
    .capture_6(),
    .shift_6(),
    .update_6(),
    .tdi_6(),
    .runtest_6(),
    .tck_6(),
    .tms_6(),
    .bscanid_en_6(),
    .tdo_6(1'B0),
    .drck_7(),
    .reset_7(),
    .sel_7(),
    .capture_7(),
    .shift_7(),
    .update_7(),
    .tdi_7(),
    .runtest_7(),
    .tck_7(),
    .tms_7(),
    .bscanid_en_7(),
    .tdo_7(1'B0),
    .drck_8(),
    .reset_8(),
    .sel_8(),
    .capture_8(),
    .shift_8(),
    .update_8(),
    .tdi_8(),
    .runtest_8(),
    .tck_8(),
    .tms_8(),
    .bscanid_en_8(),
    .tdo_8(1'B0),
    .drck_9(),
    .reset_9(),
    .sel_9(),
    .capture_9(),
    .shift_9(),
    .update_9(),
    .tdi_9(),
    .runtest_9(),
    .tck_9(),
    .tms_9(),
    .bscanid_en_9(),
    .tdo_9(1'B0),
    .drck_10(),
    .reset_10(),
    .sel_10(),
    .capture_10(),
    .shift_10(),
    .update_10(),
    .tdi_10(),
    .runtest_10(),
    .tck_10(),
    .tms_10(),
    .bscanid_en_10(),
    .tdo_10(1'B0),
    .drck_11(),
    .reset_11(),
    .sel_11(),
    .capture_11(),
    .shift_11(),
    .update_11(),
    .tdi_11(),
    .runtest_11(),
    .tck_11(),
    .tms_11(),
    .bscanid_en_11(),
    .tdo_11(1'B0),
    .drck_12(),
    .reset_12(),
    .sel_12(),
    .capture_12(),
    .shift_12(),
    .update_12(),
    .tdi_12(),
    .runtest_12(),
    .tck_12(),
    .tms_12(),
    .bscanid_en_12(),
    .tdo_12(1'B0),
    .drck_13(),
    .reset_13(),
    .sel_13(),
    .capture_13(),
    .shift_13(),
    .update_13(),
    .tdi_13(),
    .runtest_13(),
    .tck_13(),
    .tms_13(),
    .bscanid_en_13(),
    .tdo_13(1'B0),
    .drck_14(),
    .reset_14(),
    .sel_14(),
    .capture_14(),
    .shift_14(),
    .update_14(),
    .tdi_14(),
    .runtest_14(),
    .tck_14(),
    .tms_14(),
    .bscanid_en_14(),
    .tdo_14(1'B0),
    .drck_15(),
    .reset_15(),
    .sel_15(),
    .capture_15(),
    .shift_15(),
    .update_15(),
    .tdi_15(),
    .runtest_15(),
    .tck_15(),
    .tms_15(),
    .bscanid_en_15(),
    .tdo_15(1'B0),
    .drck_16(),
    .reset_16(),
    .sel_16(),
    .capture_16(),
    .shift_16(),
    .update_16(),
    .tdi_16(),
    .runtest_16(),
    .tck_16(),
    .tms_16(),
    .bscanid_en_16(),
    .tdo_16(1'B0)
  );
endmodule
