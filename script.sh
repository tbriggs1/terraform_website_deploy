#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx && git
apt-get update
apt-get -y install nginx
apt-get -y install git

# Pull and copy the website
git clone https://github.com/tbriggs1/alex_prod.git
cd alex_prod
cp -a . /var/www/html


# make sure nginx is started
service nginx start
