FROM boxedcode/alpine-nginx-php-fpm
COPY ssl/ser* /etc/nginx/ssl/
COPY default.conf /etc/nginx/conf.d/default.conf
ADD df.php /var/www/html/df/index.php
