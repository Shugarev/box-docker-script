#!/bin/sh

# find file unlock.pl in 
for container in `docker ps -q`; do 
    docker inspect --format='{{.Name}}' $container;
    docker exec $container find -iname 'unlock.pl'
done