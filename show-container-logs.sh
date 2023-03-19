#!/bin/bash

if [ -z "$1" ]
then
    echo 'Usage:  docker logs [OPTIONS] CONTAINER'
else
    docker logs $1
fi