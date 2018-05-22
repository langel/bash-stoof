#!/bin/bash

containers="$$(docker ps -aq)"; \
docker stop $$containers; \
docker rm $$containers; \
docker rmi $$(docker images -q) -f

echo "### ALL DOCKER IMAGES AND CONTAINERS PURGED"
