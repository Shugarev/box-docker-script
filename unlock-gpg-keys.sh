#!/bin/bash

cd ~/box-docker/box-deploy/

# разлочить ключи
#sudo chown -R root:root gnupg_data
#sudo chmod 0700 gnupg_data
docker exec -u $(id -u) -it $(docker ps | grep 'rest-gpg:' | awk '{print $1}') bash -c '/opt/project/rest-gpg/app/bin/unlock.pl gpg@boxdeploy.test'
