#!/bin/sh

# https://boxplat.atlassian.net/wiki/spaces/KB/pages/393217#%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F-%D0%B4%D0%BB%D1%8F-%D0%B1%D1%8D%D0%BA%D0%B5%D0%BD%D0%B4%D0%B0-%D0%B0%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%82%D0%BE%D1%80%D0%B0

#./executor.sh reset_password --login tech

# generate client certificate
./executor.sh generate_certificate --type client --for admin --name tech