#!/bin/bash
#ifconfig eth0 hw ether 54:bf:64:73:59:70
#echo $#
source /tools/Xilinx/Vivado/2023.2/settings64.sh
echo You must set the LM_LICENSE_FILE appropriately at runtime!
alias use_nvc="export VUNIT_SIMULATOR=nvc;export VUNIT_NVC_PATH=/usr/local/bin"
alias use_ghdl="export VUNIT_SIMULATOR=ghdl;export VUNIT_MODELSIM_PATH=/tools/questa/2023.3/questasim/bin"
alias use_questa2023.3="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/questa/2023.3/questasim/bin"
alias use_questa_starter="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.3/questa_fse/bin"
alias vivado2020="source /export/data_1/Xilinx/Vivado/2020.1/settings64.sh"
alias vivado2022="source /export/data_1/Xilinx/Vivado/2022.2/settings64.sh"
alias vivado2023="source /tools/Xilinx/Vivado/2023.2/settings64.sh"
alias vunitpy="source /tools/vhdl_py_env/bin/activate"
export VUNIT_SIMULATOR=modelsim
export VUNIT_MODELSIM_PATH=/tools/quartus/2023.3/questa_fse/bin
export LM_LICENSE_FILE=2100@cv-flexserverB.ad.nrao.edu:1717@cv-flexserverB.ad.nrao.edu:27000@flexlm.aoc.nrao.edu:/tools/quartus/intel_creon.dat:27007@cvflexserverc
export INTELFPGAOCLSDKROOT="/tools/quartus/2023.3/hld"
export QSYS_ROOTDIR="/tools/quartus/2023.3/qsys/bin"
export PATH=$PATH:/tools/ghdl/bin:/tools/questa/2023.3/questasim/bin:/tools/sigasi:/tools/quartus/2023.3/quartus/bin

if [ $# -gt 0 ]
then
  exec "$@"
else
  bash
fi
 