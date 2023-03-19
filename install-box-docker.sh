#!/bin/bash

#Содать папку box-docker
cd ~/box-docker/
git clone git@smarthomedevs.work:box/box-deploy.git 

cd ~/box-docker/box-deploy/
git clone  git@smarthomedevs.work:box/box.git
git clone  git@smarthomedevs.work:box/box-checkout-api.git
git clone  git@smarthomedevs.work:nameless/framework.git
git clone  git@smarthomedevs.work:box/box-front-proxy.git

#новая ветка
git clone git@smarthomedevs.work:box/box-merchant-api.git

cd ~/box-docker/box-deploy/box
git submodule update --recursive --init

# остановить mysql потому, что контейнер с mysql работает на порту 3306
sudo service mysql stop

# скопировать файл local.dev.node.env.example в local.dev.node и изменить ip
cd ~/box-docker/
./create-local_dev_node_env.sh

# запустить build ключ h прописывает домены с локальным ip в /etc/hosts
cd ~/box-docker/box-deploy/
./docker.sh build && ./docker.sh tag && ./docker.sh tag_release && sudo ./local_install.sh -ilDxCh

# Done.
# Available domains:
# 192.168.2.12 api.box.local
# 192.168.2.12 admin.box.local
# 192.168.2.12 checkout.box.local
# 192.168.2.12 merchant.box.local
# 192.168.2.12 metrics.box.local
# 192.168.2.12 admin-api.box.local
# 192.168.2.12 checkout-api.box.local

# склонировать base-proxy
# git clone  git@smarthomedevs.work:box/base-proxy.git