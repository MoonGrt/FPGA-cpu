set_property SRC_FILE_INFO {cfile:f:/Study/digit_circuit/cpu_design/cpu6_1/cpu6_1.srcs/sources_1/ip/cpuclk/cpuclk.xdc rfile:../../../cpu6_1.srcs/sources_1/ip/cpuclk/cpuclk.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
