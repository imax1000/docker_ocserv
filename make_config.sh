#!/bin/sh

mkdir config
touch config/ocpasswd

#Создание ссылок на сертификаты
ln -s /etc/letsencrypt/live/ihomevpn.sytes.net/fullchain.pem ./config/fullchain.pem
ln -s /etc/letsencrypt/live/ihomevpn.sytes.net/privkey.pem  ./config/privkey.pem
