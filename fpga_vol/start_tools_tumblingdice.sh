#!/bin/sh
sudo docker run -it --cap-add NET_ADMIN -v /tools:/tools -v /home/mschiller:/mnt/home -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e LM_LICENSE_FILE=/tools/quartus/quartus.dat fpga_vol:2023

