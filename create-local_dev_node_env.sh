#!/bin/bash
# uncomment lines!!!

cd ~/box-docker/box-deploy/

file=local.dev.node.env

cp local.dev.node.env.example  $file

ips=($(ip -4  -t -br  address|grep -v ^lo |grep -v ^docker | awk '{print $3}' | sed 's/\/.*//'))
echo -e "local ip: ${ips} \n";

local_ip="export DEV_HOST_IP=${ips}"
echo ${local_ip}

sed -i -e  "s/export DEV_HOST_IP=.*/${local_ip}/g"  ${file} 
