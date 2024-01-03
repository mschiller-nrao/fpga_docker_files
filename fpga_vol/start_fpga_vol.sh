#!/bin/bash
if [ -d /mnt/home/.ssh ]; then
  # we are running interactively, so can copy some configurations
  mkdir /home/ci/.ssh
  cp -f /mnt/home/.ssh/* /home/ci/.ssh
  cd /mnt/home
  if [ -f /mnt/home/.gitconfig ]; then
    cp -f /mnt/home/.gitconfig /home/ci
  fi
else
  # if we are running non-interactively, assume "normal" network too, so change the ether address for licenses
  sudo ifconfig eth0 hw ether $ETH_ADDRESS_TO_SET
  cd /home/ci
fi

#echo $#
# find the newest 2023.x vivado installed
shopt -s expand_aliases
if [ -f /tools/Xilinx/Vivado/2023.3/settings64.sh ]; then
  echo "Using Vivado 2023.3"
  source /tools/Xilinx/Vivado/2023.3/settings64.sh
elif [ -f /tools/Xilinx/Vivado/2023.2/settings64.sh ]; then
  echo "Using Vivado 2023.2"
  source /tools/Xilinx/Vivado/2023.2/settings64.sh
elif [ -f /tools/Xilinx/Vivado/2023.2/settings64.sh ]; then
  echo "Using Vivado 2023.1"
  source /tools/Xilinx/Vivado/2023.1/settings64.sh
else
  echo "No Vivado 2023 found"
fi

if [ -f /tools/quartus/2023.4/quartus/bin/quartus ]; then
  echo "Using quartus 2023.4"
  alias squartus="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.4/quartus/bin/quartus"
  alias squartus_sh="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.4/quartus/bin/quartus_sh"
  export PATH=/tools/quartus/2023.4/qsys/bin:/tools/quartus/2023.4/quartus/bin:/tools/quartus/2023.4/questa_fe/bin:$PATH
  export VUNIT_SIMULATOR=modelsim
  export VUNIT_MODELSIM_PATH=/tools/quartus/2023.4/questa_fe/bin
  alias use_questa_fe="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.4/questa_fe/bin"
  alias use_questa_fse="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.4/questa_fse/bin"
elif [ -f tools/quartus/2023.3/quartus/bin/quartus ]; then
  echo "Using quartus 2023.3"
  alias squartus="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.3/quartus/bin/quartus"
  alias squartus_sh="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.3/quartus/bin/quartus_sh"
  export PATH=/tools/quartus/2023.3/qsys/bin:/tools/quartus/2023.3/quartus/bin:/tools/quartus/2023.3/questa_fe/bin:$PATH
  export VUNIT_SIMULATOR=modelsim
  export VUNIT_MODELSIM_PATH=/tools/quartus/2023.3/questa_fe/bin
  alias use_questa_fe="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.3/questa_fe/bin"
  alias use_questa_fse="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.3/questa_fse/bin"

elif [ -f tools/quartus/2023.2/quartus/bin/quartus ]; then
  echo "Using quartus 2023.2"
  alias squartus="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.2/quartus/bin/quartus"
  alias squartus_sh="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.2/quartus/bin/quartus_sh"
  export PATH=/tools/quartus/2023.2/qsys/bin:/tools/quartus/2023.2/quartus/bin:/tools/quartus/2023.2/questa_fe/bin:$PATH
  export VUNIT_SIMULATOR=modelsim
  export VUNIT_MODELSIM_PATH=/tools/quartus/2023.2/questa_fe/bin
  alias use_questa_fe="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.2/questa_fe/bin"
  alias use_questa_fse="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.2/questa_fse/bin"

elif [ -f tools/quartus/2023.1/quartus/bin/quartus ]; then
  echo "Using quartus 2023.1"
  alias squartus="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.1/quartus/bin/quartus"
  alias squartus_sh="LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 /tools/quartus/2023.1/quartus/bin/quartus_sh"
  export PATH=/tools/quartus/2023.1/qsys/bin:/tools/quartus/2023.1/quartus/bin:/tools/quartus/2023.1/questa_fe/bin:$PATH
  export VUNIT_SIMULATOR=modelsim
  export VUNIT_MODELSIM_PATH=/tools/quartus/2023.1/questa_fe/bin
  alias use_questa_fe="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.1/questa_fe/bin"
  alias use_questa_fse="export VUNIT_SIMULATOR=modelsim;export VUNIT_MODELSIM_PATH=/tools/quartus/2023.1/questa_fse/bin"
else
  echo "No Quartus 2023 found"
fi

if [[ -z "${LM_LICENSE_FILE}" ]]; then
	echo You must set the LM_LICENSE_FILE appropriately at runtime!
fi

if [ $# -gt 0 ]
then
  exec "$@"
else
  bash 
fi
 
