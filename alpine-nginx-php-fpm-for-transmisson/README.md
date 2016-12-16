# Introduction

This is a set of build files including a Dockerfile to build a container image for nginx(with http2 support) and php-fpm based on Alpine Linux to keep the size of the container small, and inspired by the work done by [Ric Harvey](https://github.com/ngineered/nginx-php-fpm). The container can also use environment variables to configure your web application using the templating detailed in the special features section.

# Git repository

The source files for this project can be found here: [https://gitlab.com/boxedcode/alpine-nginx-php-fpm](https://gitlab.com/boxedcode/alpine-nginx-php-fpm)

If you have any improvements please submit a pull request.

# Docker hub repository

The Docker hub build can be found here: [https://hub.docker.com/r/boxedcode/alpine-nginx-php-fpm/](https://hub.docker.com/r/boxedcode/alpine-nginx-php-fpm/)

# Nginx versions

* v1.0.0: 1.10.1
* v1.1.0: 1.10.1
* v1.2.0: 1.10.1
* v1.3.0: 1.10.1
* v1.3.1: 1.10.1
* Latest: 1.10.1

# PHP FPM versions

* v1.0.0: 7.0.7
* v1.1.0: 7.0.8
* v1.2.0: 7.0.11
* v1.3.0: 7.0.13
* v1.3.1: 7.0.13
* Latest: 7.0.13

## Installation

Pull the image from the docker index rather than downloading the git repo. This prevents you having to build the image on every docker host.

docker pull boxedcode/alpine-nginx-php-fpm:latest

To pull the v1.3.1 Version:

docker pull boxedcode/alpine-nginx-php-fpm:v1.3.1

## Run the container

To simply run the container:

    sudo docker run --name nginx -p 443:443 -d boxedcode/alpine-nginx-php-fpm

You can then browse to https://{docker_host}:443 to view the default index.php file which shows the output of phpinfo()

## Volumes

### Website directory

If you want to link to your web site directory on the docker host to the container run:

    sudo docker run --name nginx -p 443:443 -v /your_code_directory:/var/www/html -d boxedcode/alpine-nginx-php-fpm
    
### Logging

By default, all logging is sent to stdout and stderr, which facilitates using logging drivers for the docker container with tools such as fluentd etc. More information on docker containers and logging can be found [here](https://docs.docker.com/engine/admin/logging/overview/)

However, if you want to manage logging the old fashioned way with files, you can manage your log files on your docker host by linking to the nginx log directory in the container by running:

    sudo docker run --name nginx -p 443:443 -v /your_log_directory:/var/log/nginx -d boxedcode/alpine-nginx-php-fpm

**Note:** To manage logging the old fashioned way, you will need to override the default logging directives in your nginx configuration file to log to the nginx log file directory, i.e.
    
    access_log /var/log/nginx/<your_access_log_file>;
    error_log /var/log/nginx/<your_error_log_file>;

### SSL

For SSL enabled sites (recommended!), create a folder on your docker host containing your SSL certificate and key file, and link it to the SSL directory on the container by running:

    sudo docker run --name nginx -p 443:443 -v /your_ssl_config_directory:/etc/nginx/ssl -d boxedcode/alpine-nginx-php-fpm
    
## Special Features
 
### Templating
 
If you template your code, this container can automatically configure your web application when you pass an environment variable of ```-e TEMPLATE_NGINX_HTML=1```. For example, if you want to link to an external MySQL DB you can pass variables directly to the container that will be automatically configured by the container.

Example:

    sudo docker run -e 'MYSQL_HOST=host.x.y.z' -e 'MYSQL_USER=username' -e 'MYSQL_PASS=password' -p 443:443 -e TEMPLATE_NGINX_HTML=1 -d boxedcode/alpine-nginx-php-fpm
    
This will expose the following variables that can be used to template your code.

    MYSQL_HOST=host.x.y.z
    MYSQL_USER=username
    MYSQL_PASS=password
        
To use these variables in a template, do the following in your file:
  
    <?php
    database_host = $$_MYSQL_HOST_$$;
    database_user = $$_MYSQL_USER_$$;
    database_pass = $$_MYSQL_PASS_$$
    ...
    ?>

### Caching

By default, the container is automatically configured to use Zend opcache with php with a decent default configuration. If you do not wish to use opcache, simply pass an environment variable of ```-e NO_OPCACHE=1```, and opcache will be disabled.

Example:

    sudo docker run --name nginx -p 443:443 -v /your_ssl_config_directory:/etc/nginx/ssl -e NO_OPCACHE=1 -d boxedcode/alpine-nginx-php-fpm

### Display Errors
 
If you want to display PHP errors on screen for debugging use this feature: -e ERRORS=1

### Template Anything

Yes **ANYTHING**, any variable exposed by the -e flag lets you template your config files. This means you can add redis, mariaDB, memcache or anything you want to your application very easily.