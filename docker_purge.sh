#!/bin/bash

printf "\n### PURGING ALL DOCKER IMAGES AND CONTAINERS\n\n"

containers="$(docker ps -aq)"; \
docker stop $containers; \
docker rm $containers; \
docker rmi $(docker images -q) -f

