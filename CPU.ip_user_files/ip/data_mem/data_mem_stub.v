// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Sep 21 22:00:18 2023
// Host        : DESKTOP-0TSH46O running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/Study/digit_circuit/cpu_design/cpu6_1/cpu6_1.srcs/sources_1/ip/data_mem/data_mem_stub.v
// Design      : data_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2017.4" *)
module data_mem(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[9:0],d[15:0],clk,we,spo[15:0]" */;
  input [9:0]a;
  input [15:0]d;
  input clk;
  input we;
  output [15:0]spo;
endmodule
