#!/bin/bash

build(){
  sudo docker buildx build -t ghcr.io/lautjeds/immich-server:latest-raspi --platform linux/arm64 -f server/Dockerfile .
}

if ! build; then
  sudo /home/lautjeds/Software/UpdateDockerBuildHooks.sh
fi

build

sudo docker image push ghcr.io/lautjeds/immich-server:latest-raspi
