#!/bin/bash

build(){
  sudo docker buildx build -t ghcr.io/lautjeds/immich-machine-learning:latest-raspi --platform linux/arm64 machine-learning
}

if ! build; then
  sudo /home/lautjeds/Software/UpdateDockerBuildHooks.sh
fi

build

sudo docker image push ghcr.io/lautjeds/immich-machine-learning:latest-raspi
