#!/bin/bash
alpine-nginx-php-fpm-for-transmisson/ssl/selfssl.sh
if hash docker-compose 2>/dev/null; then
	echo "init done"
else
	curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	echo "init done"
fi
