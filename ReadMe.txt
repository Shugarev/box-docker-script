При неправильной установке( т.е. вроде бы все установилось не не все работает)
# Проверить все ли контейнеры поднялись
docker ps -a 
# Если есть не поднятые контейнры нужно посмотреть логи в этих контейнерах
docker logs box_proxy
# Внимательно читаем логи!!!


# *Если не открывается https://admin.box.local:5443/ а все контейнеры запущены:
# Проверить ip /home/sergey/box-docker/box-deploy/local.dev.node.env должен быть указан ip текущей локальной сети!!!
# export DEV_HOST_IP=192.168.2.12 - если подключены к wifi
# export DEV_HOST_IP=192.168.133.3

#* Eсли не правильно указан ip, то возникает ошибка с сертификатами.
# Проверяем, что все контейнеры запущены
# На всякий случай проверяем, что остановлен локальный mysql.
# ping admin.box.local если команда не выполняется смотрим на записи в /etc/hosts
# Проверяем доступность web interface:
curl -v -k  https://admin.box.local:5443/ 
curl -v -k https://192.168.2.12:5443 -H "Host: admin.box.local" 
# Проверяем логи в proxy ко
 docker logs box_proxy контейнере
#Перестартовать все контейнеры
docker restart $(docker ps -a -q)

#зайти на виртуалку вот так 
ssh -D 8080 sergey@164.92.163.38

# выполнить запрос:
curl -k --connect-timeout 10 -H 'Host: admin.fraud.tokenpay.stg' https://31.206.221.76:8098
***
curl: (28) Connection timeout after 10001 ms


в /etc/hosts
# Turkey shield
31.206.221.76 admin.fraud.tokenpay.stg
31.206.221.76 merchant.fraud.tokenpay.stg
31.206.221.76 api.fraud.tokenpay.stg

#потом в браузере поставить в настройках прокси сокс localhost:8080
#settings (набираем в строке poxy )
#ставим галочку manual 
#SOCKS Host:localhost  Port:8080

# Склонировать Centos7 
cd /home/sergey/box-docker
git clone git@smarthomedevs.work:box/base-local-centos7.git

# Выполнить build Centos7. Запускать build каждый раз после очистки конетейнеров.
cd /home/sergey/box-docker/base-local-centos7
docker build -t registry.smarthomedevs.work/box/base-local-centos7:latest .

# Выполнить build box.
cd /home/sergey/box-docker/box-deploy
sudo rm -rf mysql_data/* && ./docker.sh build && ./docker.sh tag && ./docker.sh tag_release && ./local_install.sh -ilDCx


# Если не поднимается контейнер checkout-api то сделать build. Дополнительно скопировать репозиторий box в box-checkout-api
cd ~/box-docker/box-deploy/box-checkout-api 
./docker.sh build && ./docker.sh tag && ./docker.sh tag_release