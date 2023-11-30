#!/bin/sh
#docker build -t questasim:2023.3 -volume /export/data_1/gitlab-runner/docker_builds/questa/questa_sim-2023.3_2.aol:/opt/questa_sim-2023.3_2.aol .
#docker push gitlab.nrao.edu:5050/ngvlabackend/siriushdl/questa:2023.1
#podman build -t questasim:2023.3 --squash-all --volume /export/data_1/questa/questa_sim-2023.3_2.aol:/opt/questa_sim-2023.3_2.aol .
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
if [ ! -f $SCRIPT_DIR/FPGAs_AdaptiveSoCs_Unified_2023.2_1013_2256_Lin64.bin ]
then
    echo "Because of website authentication, you must download the Vivado Webinstaller manually from Xilinx's website"
    echo "Place the FPGAs_AdaptiveSoCs_Unified_2023.2_1013_2256_Lin64.bin file in the script directory"
    exit 1
fi  

#First we need to get an auth token
# This is interactive so the user must be involved.
TMP_DIR=$(mktemp)
rm -rf $TMP_DIR
$SCRIPT_DIR/FPGAs_AdaptiveSoCs_Unified_2023.2_1013_2256_Lin64.bin --target $TMP_DIR -- -b AuthTokenGen
rm -rf $TMP_DIR
# That should generate ~/.Xilinx/wi_authentication_key
# which needs to exist for the dockerfile we copy it here for convienance.
cp ~/.Xilinx/wi_authentication_key .

docker build -t vivado:2023.2 -f Dockerfile_2023.2 .
