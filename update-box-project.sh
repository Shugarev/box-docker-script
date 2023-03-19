#!/bin/bash

cd ~/box-docker/box-deploy/box

if [ -z "$1" ]
then
    git checkout master
else
	git fetch
	remote_id=$1
	echo "remote_id=${remote_id}"
	
    branch_id=$(git ls-remote | grep ${remote_id})
    echo "branch_id=${branch_id}"
    
    branch_name=$(echo ${branch_id} |  sed  's/^.*\///g')
    echo "branch_name=${branch_name}"
    git checkout ${branch_name}        
fi
git pull --rebase
git submodule update --recursive


