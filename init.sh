#!/bin/bash
if hash docker 2>/dev/null; then
        echo "docker has installed"
else
	curl -fsSL https://get.docker.com/ | sh
	sudo groupadd docker
	sudo usermod -aG docker $USER
	sudo systemctl enable docker.service
	sudo systemctl start docker
        echo "docker has installed"
	echo "relogin your session!!!!"
fi
sudo sysctl net.ipv6.conf.all.forwarding=1
cp docker-compose.yml.tem docker-compose.yml
cd alpine-nginx-php-fpm-for-transmisson/ssl/
./selfssl.sh
#cp ser* alpine-nginx-php-fpm-for-transmisson/ssl/
if hash docker-compose 2>/dev/null; then
	echo "init done"
else
	sudo apt install -y python-pip ; sudo pip install docker-compose
	echo "init done"
fi
