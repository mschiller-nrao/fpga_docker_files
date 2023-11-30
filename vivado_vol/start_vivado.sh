#!/bin/bash
#ifconfig eth0 hw ether 54:bf:64:73:59:70
#echo $#
source /tools/Xilinx/Vivado/2023.2/settings64.sh
echo You must set the LM_LICENSE_FILE appropriately at runtime!
if [ $# -gt 0 ]
then
  exec "$@"
else
  bash
fi
 