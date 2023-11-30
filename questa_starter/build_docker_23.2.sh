#!/bin/sh
#docker build -t questasim:2023.3 -volume /export/data_1/gitlab-runner/docker_builds/questa/questa_sim-2023.3_2.aol:/opt/questa_sim-2023.3_2.aol .
#docker push gitlab.nrao.edu:5050/ngvlabackend/siriushdl/questa:2023.1
#podman build -t questasim:2023.3 --squash-all --volume /export/data_1/gitlab-runner/docker_builds/questa/questa_sim-2023.3_2.aol:/opt/questa_sim-2023.3_2.aol .
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [ ! -f $SCRIPT_DIR/quartus_fse.dat ]
then
    echo "Create a Questa Starter Edition License file at  https://licensing.intel.com/psg/s/?language=en_US"
    echo "Create the file in the same directory as this script, and name it quartus_fse.dat"
    echo "Then rerun the build script"
    exit 1
fi

#while the quartus download is 23.3, the underlying questa is actually 2023.2, so label the build accordingly
docker build -t questa_starter:2023.2 -f Dockerfile_2023.2 .
