-makelib ies_lib/xil_defaultlib -sv \
  "G:/Xilinx3/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "G:/Xilinx3/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/dist_mem_gen_v8_0_12 \
  "../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../cpu6_8.srcs/sources_1/ip/inst_mem/sim/inst_mem.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

