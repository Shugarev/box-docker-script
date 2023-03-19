#!/bin/bash

docker ps -a --format 'table {{.Names}}\t{{.Status}}\t{{.Image}}'

# docker ps --format '{{.ID}}'
# docker ps --format '{{.Image}}'
# docker ps --format '{{.Command}}'
# docker ps --format '{{.RunningFor}}'
# docker ps --format '{{.Ports}}'

# more information:
# https://docs.docker.com/engine/reference/commandline/ps/#formatting
