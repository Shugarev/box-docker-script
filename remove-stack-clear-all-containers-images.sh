#!/bin/bash

docker stop $(docker ps -a -q)

docker kill $(docker ps -q)

/home/sergey/box-docker/box-deploy/docker.sh clean
docker system prune
docker image prune --all
