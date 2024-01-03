#!/bin/sh
sudo docker run -it --network="host" -v /tools:/tools -v /export/data_1/gitlab-runner:/mnt/home -v /tmp/.X11-unix:/tmp/.X11-unix -h $HOSTNAME -v $HOME/.Xauthority:/home/ci/.Xauthority -e DISPLAY=$DISPLAY -e LM_LICENSE_FILE=/tools/quartus/quartus.dat fpga_vol:2023

