#!/bin/sh
#docker build -t questasim:2023.3 -volume /export/data_1/gitlab-runner/docker_builds/questa/questa_sim-2023.3_2.aol:/opt/questa_sim-2023.3_2.aol .
#docker push gitlab.nrao.edu:5050/ngvlabackend/siriushdl/questa:2023.1
#podman build -t questasim:2023.3 --squash-all --volume /export/data_1/gitlab-runner/docker_builds/questa/questa_sim-2023.3_2.aol:/opt/questa_sim-2023.3_2.aol .
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build -t quartus_vol:2023.3 -f Dockerfile_2023.3 .
