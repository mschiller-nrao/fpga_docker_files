#!/bin/sh
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
docker pull debian:bookwork
docker build -t fpga_vol:vcst -f Dockerfile .
