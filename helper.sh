#!/bin/bash

usage() {
    cat <<EOU
Usage: $0 [-a] [-d] [-c] [-R] [-h] [-s] [-i] [-l] [-A] [-C]

    Optional arguments:
    -a - do all

    -d - install docker and packages
    -c - install docker-compose
    -R - login to dev registry
    -h - add local domains to /etc/hosts
    -i - deploy/redeploy local box
    -D - use source share for deploy
    -A - use admin-api source share for deploy
    -C - use checkout-api source share for deploy
    -x - compatible deploy (old configs), локальные конфиги из profile-compact, инчаче из profile
    -s - just stop services (combine with -i)

    -l - do not update images on deploy, если удалил все контейнеры и все образы попробовать запускать без этого ключа

Combinations of any options are allowed

Билд без миграций
./docker.sh build && ./docker.sh tag && ./docker.sh tag_release &&  ./local_install.sh -ix

Билд с миграциями  и прописывания данных в /etc/hosts
sudo rm -rf mysql_data/* && ./docker.sh build && ./docker.sh tag && ./docker.sh tag_release && sudo ./local_install.sh -ilDChx

EOU
    1>&2; exit 1; 
}