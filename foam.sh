#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE[0]})

existingContainer="$(docker-compose ps -q foam)"

if [[ "" == "$existingContainer" ]]; then
    # Allow opening windows from the docker container
    xhost +localhost
    exec docker-compose run --rm foam
else
    exec docker exec -it "$existingContainer" bash
fi
