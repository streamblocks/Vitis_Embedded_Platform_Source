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


// IP VLNV: xilinx.com:ip:bs_mux:1.0
// IP Revision: 0

(* X_CORE_INFO = "bs_mux_v1_0_0_bs_mux,Vivado 2020.1" *)
(* CHECK_LICENSE_TYPE = "bd_204d_bs_mux_0,bs_mux_v1_0_0_bs_mux,{}" *)
(* CORE_GENERATION_INFO = "bd_204d_bs_mux_0,bs_mux_v1_0_0_bs_mux,{x_ipProduct=Vivado 2020.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=bs_mux,x_ipVersion=1.0,x_ipCoreRevision=0,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_BSCANID=76547072}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_204d_bs_mux_0 (
  mux_ctrl_update,
  mux_ctrl_capture,
  mux_ctrl_reset,
  mux_ctrl_runtest,
  mux_ctrl_tck,
  mux_ctrl_tms,
  mux_ctrl_tdi,
  mux_ctrl_sel,
  mux_ctrl_shift,
  mux_ctrl_drck,
  mux_ctrl_bscanid_en,
  mux_ctrl_tdo,
  prim_update,
  prim_capture,
  prim_reset,
  prim_runtest,
  prim_tck,
  prim_tms,
  prim_tdi,
  prim_sel,
  prim_shift,
  prim_drck,
  prim_bscanid_en,
  prim_tdo,
  soft_update,
  soft_capture,
  soft_reset,
  soft_runtest,
  soft_tck,
  soft_tms,
  soft_tdi,
  soft_sel,
  soft_shift,
  soft_drck,
  soft_bscanid_en,
  soft_tdo,
  update,
  capture,
  reset,
  runtest,
  tck,
  tms,
  tdi,
  sel,
  shift,
  drck,
  bscanid_en,
  tdo,
  mux
);

(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs UPDATE" *)
input wire mux_ctrl_update;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs CAPTURE" *)
input wire mux_ctrl_capture;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs RESET" *)
input wire mux_ctrl_reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs RUNTEST" *)
input wire mux_ctrl_runtest;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs TCK" *)
input wire mux_ctrl_tck;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs TMS" *)
input wire mux_ctrl_tms;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs TDI" *)
input wire mux_ctrl_tdi;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs SEL" *)
input wire mux_ctrl_sel;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs SHIFT" *)
input wire mux_ctrl_shift;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs DRCK" *)
input wire mux_ctrl_drck;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs BSCANID_EN" *)
input wire mux_ctrl_bscanid_en;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 mux_ctrl_bs TDO" *)
output wire mux_ctrl_tdo;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan UPDATE" *)
input wire prim_update;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan CAPTURE" *)
input wire prim_capture;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan RESET" *)
input wire prim_reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan RUNTEST" *)
input wire prim_runtest;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan TCK" *)
input wire prim_tck;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan TMS" *)
input wire prim_tms;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan TDI" *)
input wire prim_tdi;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan SEL" *)
input wire prim_sel;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan SHIFT" *)
input wire prim_shift;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan DRCK" *)
input wire prim_drck;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan BSCANID_EN" *)
input wire prim_bscanid_en;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 prim_bscan TDO" *)
output wire prim_tdo;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan UPDATE" *)
input wire soft_update;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan CAPTURE" *)
input wire soft_capture;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan RESET" *)
input wire soft_reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan RUNTEST" *)
input wire soft_runtest;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan TCK" *)
input wire soft_tck;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan TMS" *)
input wire soft_tms;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan TDI" *)
input wire soft_tdi;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan SEL" *)
input wire soft_sel;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan SHIFT" *)
input wire soft_shift;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan DRCK" *)
input wire soft_drck;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan BSCANID_EN" *)
input wire soft_bscanid_en;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 soft_bscan TDO" *)
output wire soft_tdo;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan UPDATE" *)
output wire update;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan CAPTURE" *)
output wire capture;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RESET" *)
output wire reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RUNTEST" *)
output wire runtest;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TCK" *)
output wire tck;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TMS" *)
output wire tms;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDI" *)
output wire tdi;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SEL" *)
output wire sel;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SHIFT" *)
output wire shift;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan DRCK" *)
output wire drck;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan BSCANID_en" *)
output wire bscanid_en;
(* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDO" *)
input wire tdo;
output wire mux;

  bs_mux_v1_0_0_bs_mux #(
    .C_BSCANID(76547072)
  ) inst (
    .mux_ctrl_update(mux_ctrl_update),
    .mux_ctrl_capture(mux_ctrl_capture),
    .mux_ctrl_reset(mux_ctrl_reset),
    .mux_ctrl_runtest(mux_ctrl_runtest),
    .mux_ctrl_tck(mux_ctrl_tck),
    .mux_ctrl_tms(mux_ctrl_tms),
    .mux_ctrl_tdi(mux_ctrl_tdi),
    .mux_ctrl_sel(mux_ctrl_sel),
    .mux_ctrl_shift(mux_ctrl_shift),
    .mux_ctrl_drck(mux_ctrl_drck),
    .mux_ctrl_bscanid_en(mux_ctrl_bscanid_en),
    .mux_ctrl_tdo(mux_ctrl_tdo),
    .prim_update(prim_update),
    .prim_capture(prim_capture),
    .prim_reset(prim_reset),
    .prim_runtest(prim_runtest),
    .prim_tck(prim_tck),
    .prim_tms(prim_tms),
    .prim_tdi(prim_tdi),
    .prim_sel(prim_sel),
    .prim_shift(prim_shift),
    .prim_drck(prim_drck),
    .prim_bscanid_en(prim_bscanid_en),
    .prim_tdo(prim_tdo),
    .soft_update(soft_update),
    .soft_capture(soft_capture),
    .soft_reset(soft_reset),
    .soft_runtest(soft_runtest),
    .soft_tck(soft_tck),
    .soft_tms(soft_tms),
    .soft_tdi(soft_tdi),
    .soft_sel(soft_sel),
    .soft_shift(soft_shift),
    .soft_drck(soft_drck),
    .soft_bscanid_en(soft_bscanid_en),
    .soft_tdo(soft_tdo),
    .update(update),
    .capture(capture),
    .reset(reset),
    .runtest(runtest),
    .tck(tck),
    .tms(tms),
    .tdi(tdi),
    .sel(sel),
    .shift(shift),
    .drck(drck),
    .bscanid_en(bscanid_en),
    .tdo(tdo),
    .mux(mux)
  );
endmodule
