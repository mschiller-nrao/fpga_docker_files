#!/bin/sh
docker run -it --network="host" -v /tools:/tools -v /export/data_1/gitlab-runner:/mnt/home -v /tmp/.X11-unix:/tmp/.X11-unix -h $HOSTNAME -v $HOME/.Xauthority:/home/ci/.Xauthority -e DISPLAY=$DISPLAY -e LM_LICENSE_FILE=2100@cv-flexserverB.ad.nrao.edu:1717@cv-flexserverB.ad.nrao.edu:27000@flexlm.aoc.nrao.edu:/tools/quartus/intel_creon.dat:27007@cvflexserverc 	fpga_vol:2023

