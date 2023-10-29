-makelib ies_lib/xil_defaultlib -sv \
  "G:/xilinx2/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "G:/xilinx2/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../cpu6_1.srcs/sources_1/ip/cpuclk/cpuclk_clk_wiz.v" \
  "../../../../cpu6_1.srcs/sources_1/ip/cpuclk/cpuclk.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

