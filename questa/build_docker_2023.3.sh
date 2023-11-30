#!/bin/sh
#docker build -t questasim:2023.3 -volume /export/data_1/gitlab-runner/docker_builds/questa/questa_sim-2023.3_2.aol:/opt/questa_sim-2023.3_2.aol .
#docker push gitlab.nrao.edu:5050/ngvlabackend/siriushdl/questa:2023.1
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [ ! -f $SCRIPT_DIR/questa_sim-2023.3_2.aol ]
then
    echo "The questa_sim aol file must be downloaded from Siemens website and stored in the build_docker.sh directory"
    echo "This scripe expects it to be questa_sim-2023.3_2.aol"
    exit 1
fi  
docker build -t questasim:2023.3 -f Dockerfile_2023.3 .
