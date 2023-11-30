#!/bin/bash
# Questa starter licenses are host locked
# to use with Docker you'll need to use a hard coded
# mac address set that here
ifconfig eth0 hw ether 54:bf:64:73:59:70
#echo $#
if [ $# -gt 0 ]
then
  #cmdv=$1
  #shift
  #cmdopts=$@
  #echo cmd $cmdv
  #echo opts $cmdopts
  #$cmdv $cmdopts
  exec "$@"
else
  bash
fi
 
