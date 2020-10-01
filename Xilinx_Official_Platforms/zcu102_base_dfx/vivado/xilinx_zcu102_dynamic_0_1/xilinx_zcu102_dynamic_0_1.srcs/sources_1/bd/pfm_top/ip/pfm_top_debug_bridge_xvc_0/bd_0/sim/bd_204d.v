//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_204d.bd
//Design : bd_204d
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_204d,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_204d,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "pfm_top_debug_bridge_xvc_0.hwdef" *) 
module bd_204d
   (S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    m0_bscan_bscanid_en,
    m0_bscan_capture,
    m0_bscan_drck,
    m0_bscan_reset,
    m0_bscan_runtest,
    m0_bscan_sel,
    m0_bscan_shift,
    m0_bscan_tck,
    m0_bscan_tdi,
    m0_bscan_tdo,
    m0_bscan_tms,
    m0_bscan_update,
    s_axi_aclk,
    s_axi_aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, ADDR_WIDTH 16, ARUSER_WIDTH 0, ASSOCIATED_BUSIF S_AXI, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pfm_top_clkwiz_sysclks_0_clk_out1, DATA_WIDTH 32, FREQ_HZ 75000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [4:0]S_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]S_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output S_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input S_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [4:0]S_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]S_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output S_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input S_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input S_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]S_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output S_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]S_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input S_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]S_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output S_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]S_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output S_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]S_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input S_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan BSCANID_en" *) output m0_bscan_bscanid_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan CAPTURE" *) output m0_bscan_capture;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan DRCK" *) output m0_bscan_drck;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan RESET" *) output m0_bscan_reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan RUNTEST" *) output m0_bscan_runtest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan SEL" *) output m0_bscan_sel;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan SHIFT" *) output m0_bscan_shift;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan TCK" *) output m0_bscan_tck;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan TDI" *) output m0_bscan_tdi;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan TDO" *) input m0_bscan_tdo;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan TMS" *) output m0_bscan_tms;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m0_bscan UPDATE" *) output m0_bscan_update;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXI_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn:s_axi_lite_resetn, CLK_DOMAIN pfm_top_clkwiz_sysclks_0_clk_out1, FREQ_HZ 75000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXI_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXI_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input s_axi_aresetn;

  wire [4:0]S_AXI_1_ARADDR;
  wire [2:0]S_AXI_1_ARPROT;
  wire S_AXI_1_ARREADY;
  wire S_AXI_1_ARVALID;
  wire [4:0]S_AXI_1_AWADDR;
  wire [2:0]S_AXI_1_AWPROT;
  wire S_AXI_1_AWREADY;
  wire S_AXI_1_AWVALID;
  wire S_AXI_1_BREADY;
  wire [1:0]S_AXI_1_BRESP;
  wire S_AXI_1_BVALID;
  wire [31:0]S_AXI_1_RDATA;
  wire S_AXI_1_RREADY;
  wire [1:0]S_AXI_1_RRESP;
  wire S_AXI_1_RVALID;
  wire [31:0]S_AXI_1_WDATA;
  wire S_AXI_1_WREADY;
  wire [3:0]S_AXI_1_WSTRB;
  wire S_AXI_1_WVALID;
  wire axi_jtag_tck;
  wire axi_jtag_tdi;
  wire axi_jtag_tms;
  wire bs_mux_m_bscan_BSCANID_en;
  wire bs_mux_m_bscan_CAPTURE;
  wire bs_mux_m_bscan_DRCK;
  wire bs_mux_m_bscan_RESET;
  wire bs_mux_m_bscan_RUNTEST;
  wire bs_mux_m_bscan_SEL;
  wire bs_mux_m_bscan_SHIFT;
  wire bs_mux_m_bscan_TCK;
  wire bs_mux_m_bscan_TDI;
  wire bs_mux_m_bscan_TDO;
  wire bs_mux_m_bscan_TMS;
  wire bs_mux_m_bscan_UPDATE;
  wire bs_mux_mux;
  wire bs_switch_1_m0_bscan_BSCANID_en;
  wire bs_switch_1_m0_bscan_CAPTURE;
  wire bs_switch_1_m0_bscan_DRCK;
  wire bs_switch_1_m0_bscan_RESET;
  wire bs_switch_1_m0_bscan_RUNTEST;
  wire bs_switch_1_m0_bscan_SEL;
  wire bs_switch_1_m0_bscan_SHIFT;
  wire bs_switch_1_m0_bscan_TCK;
  wire bs_switch_1_m0_bscan_TDI;
  wire bs_switch_1_m0_bscan_TDO;
  wire bs_switch_1_m0_bscan_TMS;
  wire bs_switch_1_m0_bscan_UPDATE;
  wire bs_switch_m0_bscan_BSCANID_en;
  wire bs_switch_m0_bscan_CAPTURE;
  wire bs_switch_m0_bscan_DRCK;
  wire bs_switch_m0_bscan_RESET;
  wire bs_switch_m0_bscan_RUNTEST;
  wire bs_switch_m0_bscan_SEL;
  wire bs_switch_m0_bscan_SHIFT;
  wire bs_switch_m0_bscan_TCK;
  wire bs_switch_m0_bscan_TDI;
  wire bs_switch_m0_bscan_TDO;
  wire bs_switch_m0_bscan_TMS;
  wire bs_switch_m0_bscan_UPDATE;
  wire bs_switch_m1_bscan_BSCANID_en;
  wire bs_switch_m1_bscan_CAPTURE;
  wire bs_switch_m1_bscan_DRCK;
  wire bs_switch_m1_bscan_RESET;
  wire bs_switch_m1_bscan_RUNTEST;
  wire bs_switch_m1_bscan_SEL;
  wire bs_switch_m1_bscan_SHIFT;
  wire bs_switch_m1_bscan_TCK;
  wire bs_switch_m1_bscan_TDI;
  wire bs_switch_m1_bscan_TDO;
  wire bs_switch_m1_bscan_TMS;
  wire bs_switch_m1_bscan_UPDATE;
  wire bsip_m_bscan_CAPTURE;
  wire bsip_m_bscan_DRCK;
  wire bsip_m_bscan_RESET;
  wire bsip_m_bscan_RUNTEST;
  wire bsip_m_bscan_SEL;
  wire bsip_m_bscan_SHIFT;
  wire bsip_m_bscan_TCK;
  wire bsip_m_bscan_TDI;
  wire bsip_m_bscan_TDO;
  wire bsip_m_bscan_TMS;
  wire bsip_m_bscan_UPDATE;
  wire bsip_tap_tdo;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;

  assign S_AXI_1_ARADDR = S_AXI_araddr[4:0];
  assign S_AXI_1_ARPROT = S_AXI_arprot[2:0];
  assign S_AXI_1_ARVALID = S_AXI_arvalid;
  assign S_AXI_1_AWADDR = S_AXI_awaddr[4:0];
  assign S_AXI_1_AWPROT = S_AXI_awprot[2:0];
  assign S_AXI_1_AWVALID = S_AXI_awvalid;
  assign S_AXI_1_BREADY = S_AXI_bready;
  assign S_AXI_1_RREADY = S_AXI_rready;
  assign S_AXI_1_WDATA = S_AXI_wdata[31:0];
  assign S_AXI_1_WSTRB = S_AXI_wstrb[3:0];
  assign S_AXI_1_WVALID = S_AXI_wvalid;
  assign S_AXI_arready = S_AXI_1_ARREADY;
  assign S_AXI_awready = S_AXI_1_AWREADY;
  assign S_AXI_bresp[1:0] = S_AXI_1_BRESP;
  assign S_AXI_bvalid = S_AXI_1_BVALID;
  assign S_AXI_rdata[31:0] = S_AXI_1_RDATA;
  assign S_AXI_rresp[1:0] = S_AXI_1_RRESP;
  assign S_AXI_rvalid = S_AXI_1_RVALID;
  assign S_AXI_wready = S_AXI_1_WREADY;
  assign bs_switch_1_m0_bscan_TDO = m0_bscan_tdo;
  assign m0_bscan_bscanid_en = bs_switch_1_m0_bscan_BSCANID_en;
  assign m0_bscan_capture = bs_switch_1_m0_bscan_CAPTURE;
  assign m0_bscan_drck = bs_switch_1_m0_bscan_DRCK;
  assign m0_bscan_reset = bs_switch_1_m0_bscan_RESET;
  assign m0_bscan_runtest = bs_switch_1_m0_bscan_RUNTEST;
  assign m0_bscan_sel = bs_switch_1_m0_bscan_SEL;
  assign m0_bscan_shift = bs_switch_1_m0_bscan_SHIFT;
  assign m0_bscan_tck = bs_switch_1_m0_bscan_TCK;
  assign m0_bscan_tdi = bs_switch_1_m0_bscan_TDI;
  assign m0_bscan_tms = bs_switch_1_m0_bscan_TMS;
  assign m0_bscan_update = bs_switch_1_m0_bscan_UPDATE;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  bd_204d_axi_jtag_0 axi_jtag
       (.mux_status(bs_mux_mux),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr(S_AXI_1_ARADDR),
        .s_axi_aresetn(s_axi_aresetn_1),
        .s_axi_arprot(S_AXI_1_ARPROT),
        .s_axi_arready(S_AXI_1_ARREADY),
        .s_axi_arvalid(S_AXI_1_ARVALID),
        .s_axi_awaddr(S_AXI_1_AWADDR),
        .s_axi_awprot(S_AXI_1_AWPROT),
        .s_axi_awready(S_AXI_1_AWREADY),
        .s_axi_awvalid(S_AXI_1_AWVALID),
        .s_axi_bready(S_AXI_1_BREADY),
        .s_axi_bresp(S_AXI_1_BRESP),
        .s_axi_bvalid(S_AXI_1_BVALID),
        .s_axi_rdata(S_AXI_1_RDATA),
        .s_axi_rready(S_AXI_1_RREADY),
        .s_axi_rresp(S_AXI_1_RRESP),
        .s_axi_rvalid(S_AXI_1_RVALID),
        .s_axi_wdata(S_AXI_1_WDATA),
        .s_axi_wready(S_AXI_1_WREADY),
        .s_axi_wstrb(S_AXI_1_WSTRB),
        .s_axi_wvalid(S_AXI_1_WVALID),
        .tck(axi_jtag_tck),
        .tdi(axi_jtag_tdi),
        .tdo(bsip_tap_tdo),
        .tms(axi_jtag_tms));
  bd_204d_bs_mux_0 bs_mux
       (.bscanid_en(bs_mux_m_bscan_BSCANID_en),
        .capture(bs_mux_m_bscan_CAPTURE),
        .drck(bs_mux_m_bscan_DRCK),
        .mux(bs_mux_mux),
        .mux_ctrl_bscanid_en(bs_switch_m0_bscan_BSCANID_en),
        .mux_ctrl_capture(bs_switch_m0_bscan_CAPTURE),
        .mux_ctrl_drck(bs_switch_m0_bscan_DRCK),
        .mux_ctrl_reset(bs_switch_m0_bscan_RESET),
        .mux_ctrl_runtest(bs_switch_m0_bscan_RUNTEST),
        .mux_ctrl_sel(bs_switch_m0_bscan_SEL),
        .mux_ctrl_shift(bs_switch_m0_bscan_SHIFT),
        .mux_ctrl_tck(bs_switch_m0_bscan_TCK),
        .mux_ctrl_tdi(bs_switch_m0_bscan_TDI),
        .mux_ctrl_tdo(bs_switch_m0_bscan_TDO),
        .mux_ctrl_tms(bs_switch_m0_bscan_TMS),
        .mux_ctrl_update(bs_switch_m0_bscan_UPDATE),
        .prim_bscanid_en(bs_switch_m1_bscan_BSCANID_en),
        .prim_capture(bs_switch_m1_bscan_CAPTURE),
        .prim_drck(bs_switch_m1_bscan_DRCK),
        .prim_reset(bs_switch_m1_bscan_RESET),
        .prim_runtest(bs_switch_m1_bscan_RUNTEST),
        .prim_sel(bs_switch_m1_bscan_SEL),
        .prim_shift(bs_switch_m1_bscan_SHIFT),
        .prim_tck(bs_switch_m1_bscan_TCK),
        .prim_tdi(bs_switch_m1_bscan_TDI),
        .prim_tdo(bs_switch_m1_bscan_TDO),
        .prim_tms(bs_switch_m1_bscan_TMS),
        .prim_update(bs_switch_m1_bscan_UPDATE),
        .reset(bs_mux_m_bscan_RESET),
        .runtest(bs_mux_m_bscan_RUNTEST),
        .sel(bs_mux_m_bscan_SEL),
        .shift(bs_mux_m_bscan_SHIFT),
        .soft_bscanid_en(1'b0),
        .soft_capture(bsip_m_bscan_CAPTURE),
        .soft_drck(bsip_m_bscan_DRCK),
        .soft_reset(bsip_m_bscan_RESET),
        .soft_runtest(bsip_m_bscan_RUNTEST),
        .soft_sel(bsip_m_bscan_SEL),
        .soft_shift(bsip_m_bscan_SHIFT),
        .soft_tck(bsip_m_bscan_TCK),
        .soft_tdi(bsip_m_bscan_TDI),
        .soft_tdo(bsip_m_bscan_TDO),
        .soft_tms(bsip_m_bscan_TMS),
        .soft_update(bsip_m_bscan_UPDATE),
        .tck(bs_mux_m_bscan_TCK),
        .tdi(bs_mux_m_bscan_TDI),
        .tdo(bs_mux_m_bscan_TDO),
        .tms(bs_mux_m_bscan_TMS),
        .update(bs_mux_m_bscan_UPDATE));
  bd_204d_bs_switch_2 bs_switch
       (.bscanid_en_0(bs_switch_m0_bscan_BSCANID_en),
        .bscanid_en_1(bs_switch_m1_bscan_BSCANID_en),
        .capture_0(bs_switch_m0_bscan_CAPTURE),
        .capture_1(bs_switch_m1_bscan_CAPTURE),
        .drck_0(bs_switch_m0_bscan_DRCK),
        .drck_1(bs_switch_m1_bscan_DRCK),
        .reset_0(bs_switch_m0_bscan_RESET),
        .reset_1(bs_switch_m1_bscan_RESET),
        .runtest_0(bs_switch_m0_bscan_RUNTEST),
        .runtest_1(bs_switch_m1_bscan_RUNTEST),
        .sel_0(bs_switch_m0_bscan_SEL),
        .sel_1(bs_switch_m1_bscan_SEL),
        .shift_0(bs_switch_m0_bscan_SHIFT),
        .shift_1(bs_switch_m1_bscan_SHIFT),
        .tck_0(bs_switch_m0_bscan_TCK),
        .tck_1(bs_switch_m1_bscan_TCK),
        .tdi_0(bs_switch_m0_bscan_TDI),
        .tdi_1(bs_switch_m1_bscan_TDI),
        .tdo_0(bs_switch_m0_bscan_TDO),
        .tdo_1(bs_switch_m1_bscan_TDO),
        .tms_0(bs_switch_m0_bscan_TMS),
        .tms_1(bs_switch_m1_bscan_TMS),
        .update_0(bs_switch_m0_bscan_UPDATE),
        .update_1(bs_switch_m1_bscan_UPDATE));
  bd_204d_bs_switch_1_0 bs_switch_1
       (.bscanid_en_0(bs_switch_1_m0_bscan_BSCANID_en),
        .capture_0(bs_switch_1_m0_bscan_CAPTURE),
        .drck_0(bs_switch_1_m0_bscan_DRCK),
        .reset_0(bs_switch_1_m0_bscan_RESET),
        .runtest_0(bs_switch_1_m0_bscan_RUNTEST),
        .s_bscan_capture(bs_mux_m_bscan_CAPTURE),
        .s_bscan_drck(bs_mux_m_bscan_DRCK),
        .s_bscan_reset(bs_mux_m_bscan_RESET),
        .s_bscan_runtest(bs_mux_m_bscan_RUNTEST),
        .s_bscan_sel(bs_mux_m_bscan_SEL),
        .s_bscan_shift(bs_mux_m_bscan_SHIFT),
        .s_bscan_tck(bs_mux_m_bscan_TCK),
        .s_bscan_tdi(bs_mux_m_bscan_TDI),
        .s_bscan_tdo(bs_mux_m_bscan_TDO),
        .s_bscan_tms(bs_mux_m_bscan_TMS),
        .s_bscan_update(bs_mux_m_bscan_UPDATE),
        .s_bscanid_en(bs_mux_m_bscan_BSCANID_en),
        .sel_0(bs_switch_1_m0_bscan_SEL),
        .shift_0(bs_switch_1_m0_bscan_SHIFT),
        .tck_0(bs_switch_1_m0_bscan_TCK),
        .tdi_0(bs_switch_1_m0_bscan_TDI),
        .tdo_0(bs_switch_1_m0_bscan_TDO),
        .tms_0(bs_switch_1_m0_bscan_TMS),
        .update_0(bs_switch_1_m0_bscan_UPDATE));
  bd_204d_bsip_0 bsip
       (.capture(bsip_m_bscan_CAPTURE),
        .drck(bsip_m_bscan_DRCK),
        .reset(bsip_m_bscan_RESET),
        .runtest(bsip_m_bscan_RUNTEST),
        .sel(bsip_m_bscan_SEL),
        .shift(bsip_m_bscan_SHIFT),
        .tap_tck(axi_jtag_tck),
        .tap_tdi(axi_jtag_tdi),
        .tap_tdo(bsip_tap_tdo),
        .tap_tms(axi_jtag_tms),
        .tck(bsip_m_bscan_TCK),
        .tdi(bsip_m_bscan_TDI),
        .tdo(bsip_m_bscan_TDO),
        .tms(bsip_m_bscan_TMS),
        .update(bsip_m_bscan_UPDATE));
endmodule
