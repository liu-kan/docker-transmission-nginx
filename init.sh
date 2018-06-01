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
fi
sudo sysctl net.ipv6.conf.all.forwarding=1
cp docker-compose.yml.tem docker-compose.yml
cd alpine-nginx-php-fpm-for-transmisson/ssl/
./selfssl.sh
#cp ser* alpine-nginx-php-fpm-for-transmisson/ssl/
if hash docker-compose 2>/dev/null; then
	echo "init done"
else
	sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	echo "init done"
fi
