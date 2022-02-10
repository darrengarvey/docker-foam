#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE[0]})

# Run ./foam.sh docker-compose.cpu.yml if you don't have NVIDIA/X11 setup
dockerfile="${1:-docker-compose.yml}"

existingContainer="$(docker-compose -f ${dockerfile} ps -q foam)"

if [[ "" == "$existingContainer" ]]; then
    # Allow opening windows from the docker container
    xhost +localhost
    exec docker-compose -f ${dockerfile} run --rm foam
else
    exec docker exec -it "$existingContainer" bash
fi
