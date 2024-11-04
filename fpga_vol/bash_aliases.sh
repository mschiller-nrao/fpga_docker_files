#!/bin/bash
#ifconfig eth0 hw ether 54:bf:64:73:59:70
#echo $#
# find the newest 2023.x vivado installed
shopt -s expand_aliases
#if [ -f /tools/Xilinx/Vivado/2023.3/settings64.sh ]; then
#  echo "Using Vivado 2023.3"
#  source /tools/Xilinx/Vivado/2023.3/settings64.sh
#elif [ -f /tools/Xilinx/Vivado/2023.2/settings64.sh ]; then
#  echo "Using Vivado 2023.2"
#  source /tools/Xilinx/Vivado/2023.2/settings64.sh
#elif [ -f /tools/Xilinx/Vivado/2023.2/settings64.sh ]; then
#  echo "Using Vivado 2023.1"
#  source /tools/Xilinx/Vivado/2023.1/settings64.sh
#else
#  echo "No Vivado 2023 found"	
#fi
source /pyvenv/bin/activate
if [ -f /tools/quartus/2023.4/quartus/bin/quartus ]; then
  alias squartus="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.4/quartus/bin/quartus"
  alias squartus_sh="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.4/quartus/bin/quartus_sh"
  alias use_questa_fe="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.4/questa_fe/bin"
  alias use_questa_fse="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.4/questa_fse/bin"
elif [ -f tools/quartus/2023.3/quartus/bin/quartus ]; then
  alias squartus="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.3/quartus/bin/quartus"
  alias squartus_sh="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.3/quartus/bin/quartus_sh"
  alias use_questa_fe="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.3/questa_fe/bin"
  alias use_questa_fse="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.3/questa_fse/bin"

elif [ -f tools/quartus/2023.2/quartus/bin/quartus ]; then
  alias squartus="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.2/quartus/bin/quartus"
  alias squartus_sh="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.2/quartus/bin/quartus_sh"
  alias use_questa_fe="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.2/questa_fe/bin"
  alias use_questa_fse="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.2/questa_fse/bin"

elif [ -f tools/quartus/2023.1/quartus/bin/quartus ]; then
  alias squartus="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.1/quartus/bin/quartus"
  alias squartus_sh="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.1/quartus/bin/quartus_sh"
  alias use_questa_fe="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.1/questa_fe/bin"
  alias use_questa_fse="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.1/questa_fse/bin"
fi
 
