// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Nov  8 16:54:56 2023
// Host        : DESKTOP-0TSH46O running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               F:/Study/digit_circuit/cpu_design/cpu6_8/cpu6_8.srcs/sources_1/ip/inst_mem/inst_mem_sim_netlist.v
// Design      : inst_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "inst_mem,dist_mem_gen_v8_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module inst_mem
   (a,
    spo);
  input [9:0]a;
  output [15:0]spo;

  wire [9:0]a;
  wire [15:0]spo;
  wire [15:0]NLW_U0_dpo_UNCONNECTED;
  wire [15:0]NLW_U0_qdpo_UNCONNECTED;
  wire [15:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "zynq" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "10" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1024" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "inst_mem.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "16" *) 
  inst_mem_dist_mem_gen_v8_0_12 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[15:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[15:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[15:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule

(* C_ADDR_WIDTH = "10" *) (* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "1024" *) 
(* C_ELABORATION_DIR = "./" *) (* C_FAMILY = "zynq" *) (* C_HAS_CLK = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_DPO = "0" *) (* C_HAS_DPRA = "0" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "0" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "1" *) (* C_HAS_WE = "0" *) 
(* C_MEM_INIT_FILE = "inst_mem.mif" *) (* C_MEM_TYPE = "0" *) (* C_PARSER_TYPE = "1" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "1" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "16" *) (* ORIG_REF_NAME = "dist_mem_gen_v8_0_12" *) 
module inst_mem_dist_mem_gen_v8_0_12
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [9:0]a;
  input [15:0]d;
  input [9:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [15:0]spo;
  output [15:0]dpo;
  output [15:0]qspo;
  output [15:0]qdpo;

  wire \<const0> ;
  wire [9:0]a;
  wire [15:0]spo;

  assign dpo[15] = \<const0> ;
  assign dpo[14] = \<const0> ;
  assign dpo[13] = \<const0> ;
  assign dpo[12] = \<const0> ;
  assign dpo[11] = \<const0> ;
  assign dpo[10] = \<const0> ;
  assign dpo[9] = \<const0> ;
  assign dpo[8] = \<const0> ;
  assign dpo[7] = \<const0> ;
  assign dpo[6] = \<const0> ;
  assign dpo[5] = \<const0> ;
  assign dpo[4] = \<const0> ;
  assign dpo[3] = \<const0> ;
  assign dpo[2] = \<const0> ;
  assign dpo[1] = \<const0> ;
  assign dpo[0] = \<const0> ;
  assign qdpo[15] = \<const0> ;
  assign qdpo[14] = \<const0> ;
  assign qdpo[13] = \<const0> ;
  assign qdpo[12] = \<const0> ;
  assign qdpo[11] = \<const0> ;
  assign qdpo[10] = \<const0> ;
  assign qdpo[9] = \<const0> ;
  assign qdpo[8] = \<const0> ;
  assign qdpo[7] = \<const0> ;
  assign qdpo[6] = \<const0> ;
  assign qdpo[5] = \<const0> ;
  assign qdpo[4] = \<const0> ;
  assign qdpo[3] = \<const0> ;
  assign qdpo[2] = \<const0> ;
  assign qdpo[1] = \<const0> ;
  assign qdpo[0] = \<const0> ;
  assign qspo[15] = \<const0> ;
  assign qspo[14] = \<const0> ;
  assign qspo[13] = \<const0> ;
  assign qspo[12] = \<const0> ;
  assign qspo[11] = \<const0> ;
  assign qspo[10] = \<const0> ;
  assign qspo[9] = \<const0> ;
  assign qspo[8] = \<const0> ;
  assign qspo[7] = \<const0> ;
  assign qspo[6] = \<const0> ;
  assign qspo[5] = \<const0> ;
  assign qspo[4] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  inst_mem_dist_mem_gen_v8_0_12_synth \synth_options.dist_mem_inst 
       (.a(a),
        .spo(spo));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0_12_synth" *) 
module inst_mem_dist_mem_gen_v8_0_12_synth
   (spo,
    a);
  output [15:0]spo;
  input [9:0]a;

  wire [9:0]a;
  wire [15:0]spo;

  inst_mem_rom \gen_rom.rom_inst 
       (.a(a),
        .spo(spo));
endmodule

(* ORIG_REF_NAME = "rom" *) 
module inst_mem_rom
   (spo,
    a);
  output [15:0]spo;
  input [9:0]a;

  wire [9:0]a;
  wire [15:0]spo;
  wire \spo[0]_INST_0_i_1_n_0 ;
  wire \spo[10]_INST_0_i_1_n_0 ;
  wire \spo[11]_INST_0_i_1_n_0 ;
  wire \spo[12]_INST_0_i_1_n_0 ;
  wire \spo[13]_INST_0_i_1_n_0 ;
  wire \spo[14]_INST_0_i_1_n_0 ;
  wire \spo[15]_INST_0_i_1_n_0 ;
  wire \spo[1]_INST_0_i_1_n_0 ;
  wire \spo[2]_INST_0_i_1_n_0 ;
  wire \spo[3]_INST_0_i_1_n_0 ;
  wire \spo[4]_INST_0_i_1_n_0 ;
  wire \spo[5]_INST_0_i_1_n_0 ;
  wire \spo[6]_INST_0_i_1_n_0 ;
  wire \spo[7]_INST_0_i_1_n_0 ;
  wire \spo[8]_INST_0_i_1_n_0 ;
  wire \spo[9]_INST_0_i_1_n_0 ;

  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[0]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[0]_INST_0_i_1_n_0 ),
        .O(spo[0]));
  LUT6 #(
    .INIT(64'h02DD12B011BB03D7)) 
    \spo[0]_INST_0_i_1 
       (.I0(a[0]),
        .I1(a[4]),
        .I2(a[3]),
        .I3(a[5]),
        .I4(a[1]),
        .I5(a[2]),
        .O(\spo[0]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[10]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[10]_INST_0_i_1_n_0 ),
        .O(spo[10]));
  LUT6 #(
    .INIT(64'h003E110800872611)) 
    \spo[10]_INST_0_i_1 
       (.I0(a[1]),
        .I1(a[2]),
        .I2(a[0]),
        .I3(a[5]),
        .I4(a[4]),
        .I5(a[3]),
        .O(\spo[10]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[11]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[11]_INST_0_i_1_n_0 ),
        .O(spo[11]));
  LUT6 #(
    .INIT(64'h000E108000180490)) 
    \spo[11]_INST_0_i_1 
       (.I0(a[1]),
        .I1(a[2]),
        .I2(a[0]),
        .I3(a[5]),
        .I4(a[4]),
        .I5(a[3]),
        .O(\spo[11]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[12]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[12]_INST_0_i_1_n_0 ),
        .O(spo[12]));
  LUT6 #(
    .INIT(64'h0004000400218084)) 
    \spo[12]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[3]),
        .I2(a[4]),
        .I3(a[1]),
        .I4(a[0]),
        .I5(a[5]),
        .O(\spo[12]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[13]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[13]_INST_0_i_1_n_0 ),
        .O(spo[13]));
  LUT6 #(
    .INIT(64'h0050000000000102)) 
    \spo[13]_INST_0_i_1 
       (.I0(a[5]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[0]),
        .I4(a[4]),
        .I5(a[3]),
        .O(\spo[13]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[14]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[14]_INST_0_i_1_n_0 ),
        .O(spo[14]));
  LUT6 #(
    .INIT(64'h0D0002200041000E)) 
    \spo[14]_INST_0_i_1 
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[5]),
        .I3(a[4]),
        .I4(a[3]),
        .I5(a[2]),
        .O(\spo[14]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[15]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[15]_INST_0_i_1_n_0 ),
        .O(spo[15]));
  LUT6 #(
    .INIT(64'h000000090C000000)) 
    \spo[15]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[4]),
        .I2(a[5]),
        .I3(a[3]),
        .I4(a[1]),
        .I5(a[0]),
        .O(\spo[15]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[1]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[1]_INST_0_i_1_n_0 ),
        .O(spo[1]));
  LUT6 #(
    .INIT(64'h1401011C0428100A)) 
    \spo[1]_INST_0_i_1 
       (.I0(a[3]),
        .I1(a[5]),
        .I2(a[4]),
        .I3(a[1]),
        .I4(a[0]),
        .I5(a[2]),
        .O(\spo[1]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[2]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[2]_INST_0_i_1_n_0 ),
        .O(spo[2]));
  LUT6 #(
    .INIT(64'h0000800004200104)) 
    \spo[2]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[3]),
        .I2(a[0]),
        .I3(a[1]),
        .I4(a[5]),
        .I5(a[4]),
        .O(\spo[2]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[3]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[3]_INST_0_i_1_n_0 ),
        .O(spo[3]));
  LUT6 #(
    .INIT(64'h001550050B2AB6D9)) 
    \spo[3]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[2]),
        .I2(a[0]),
        .I3(a[1]),
        .I4(a[3]),
        .I5(a[5]),
        .O(\spo[3]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[4]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[4]_INST_0_i_1_n_0 ),
        .O(spo[4]));
  LUT6 #(
    .INIT(64'h23132F4B333246F7)) 
    \spo[4]_INST_0_i_1 
       (.I0(a[1]),
        .I1(a[5]),
        .I2(a[3]),
        .I3(a[2]),
        .I4(a[4]),
        .I5(a[0]),
        .O(\spo[4]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[5]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[5]_INST_0_i_1_n_0 ),
        .O(spo[5]));
  LUT6 #(
    .INIT(64'h0000773D9BEDE085)) 
    \spo[5]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[3]),
        .I2(a[0]),
        .I3(a[1]),
        .I4(a[4]),
        .I5(a[5]),
        .O(\spo[5]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[6]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[6]_INST_0_i_1_n_0 ),
        .O(spo[6]));
  LUT6 #(
    .INIT(64'h00010201EEB2050C)) 
    \spo[6]_INST_0_i_1 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[4]),
        .I3(a[0]),
        .I4(a[2]),
        .I5(a[5]),
        .O(\spo[6]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[7]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[7]_INST_0_i_1_n_0 ),
        .O(spo[7]));
  LUT6 #(
    .INIT(64'h00000004450C5928)) 
    \spo[7]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(a[3]),
        .I5(a[5]),
        .O(\spo[7]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[8]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[8]_INST_0_i_1_n_0 ),
        .O(spo[8]));
  LUT6 #(
    .INIT(64'h0013396500D6C718)) 
    \spo[8]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[4]),
        .I4(a[5]),
        .I5(a[3]),
        .O(\spo[8]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[9]_INST_0 
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[6]),
        .I3(a[7]),
        .I4(\spo[9]_INST_0_i_1_n_0 ),
        .O(spo[9]));
  LUT6 #(
    .INIT(64'h100D372219000102)) 
    \spo[9]_INST_0_i_1 
       (.I0(a[0]),
        .I1(a[5]),
        .I2(a[4]),
        .I3(a[3]),
        .I4(a[1]),
        .I5(a[2]),
        .O(\spo[9]_INST_0_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
