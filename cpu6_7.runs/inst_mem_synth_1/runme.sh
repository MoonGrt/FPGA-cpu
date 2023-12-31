#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=G:/Xilinx3/SDK/2017.4/bin;G:/Xilinx3/Vivado/2017.4/ids_lite/ISE/bin/nt64;G:/Xilinx3/Vivado/2017.4/ids_lite/ISE/lib/nt64:G:/Xilinx3/Vivado/2017.4/bin
else
  PATH=G:/Xilinx3/SDK/2017.4/bin;G:/Xilinx3/Vivado/2017.4/ids_lite/ISE/bin/nt64;G:/Xilinx3/Vivado/2017.4/ids_lite/ISE/lib/nt64:G:/Xilinx3/Vivado/2017.4/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='F:/Study/digit_circuit/cpu_design/cpu6_7/cpu6_7.runs/inst_mem_synth_1'
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

EAStep vivado -log inst_mem.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source inst_mem.tcl
