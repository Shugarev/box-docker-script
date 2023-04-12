#!/bin/bash
source helper.sh

if [[ $# -eq 0  ]]; then

cd ~/box-docker/box-deploy/
# build with migrationd
sudo rm -rf mysql_data/* && ./docker.sh build && ./docker.sh tag && ./docker.sh tag_release && ./local_install.sh -ilDxA
    
# build without migration
# ./docker.sh build && ./docker.sh tag && ./docker.sh tag_release &&  ./local_install.sh -ilDxA

elif [[ "$1" == "--help" ]]; then
    usage     
else
    echo -e "Unexpected argument $1 \n"
    echo -e "Expected only argument --help \n"
fi


# В директории box-deploy есть три директории: box, box-checkout-api, box-front-proxy
# В директории box-checkout-api и box-front-proxy скопировать директорию box!!!!

# для того чтобы cбилдить ветки мы делаем: переходим в директор
# cd ~/box-docker/box-deploy/box-checkout-api/box
# git submodule update --recursive

# cd ~/box-docker/box-deploy/box-checkout-api(checkout_interface_yjhGaWyA) 
# ./docker.sh build && ./docker.sh tag && ./docker.sh tag_release

# сбилдить base-proxy 
