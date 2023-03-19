#!/bin/bash

# Удалить стэки
docker stack ls
#NAME      SERVICES   ORCHESTRATOR
#box       13         Swarm
docker stack rm box
