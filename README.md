# Docker OpenFOAM

Docker image for running OpenFOAM, with optional UI. Includes OpenFOAM 9 and a headless Paraview 5.10 setup.

PRs welcome!

# Prerequisites

Only tested on linux (Ubuntu 20.04) but should work on all linux distros, and most
likely OSX too (using the "Generic"/non-GPU setup).

* docker
* docker-compose

# Quick Start

## NVIDIA/X11

If you have an NVIDIA GPU and X11 display manager:

```
docker-compose build
./foam.sh
```

Anytime later you can just run `./foam.sh` and you either start a new docker container
or re-enter the running one. This is not that standard but I have found it a useful
pattern so far.

Opening paraview/paraFoam from within the container should work.

## Generic

If you don't have NVIDIA/X11:

```
docker-compose -f docker-compose.cpu.yml build
./foam.sh docker-compose.cpu.yml
```

Anytime later you can just run:

```
./foam.sh docker-compose.cpu.yml
```

This will either start a new docker container or re-enter the running one.
