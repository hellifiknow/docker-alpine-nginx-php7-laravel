# blunt1337/nginx-php7-laravel

[![](https://images.microbadger.com/badges/image/blunt1337/nginx-php7-laravel.svg)](https://microbadger.com/images/blunt1337/nginx-php7-laravel)

This is a [Docker image](https://www.docker.com/) to use as a web server with Nginx, PHP 7.1 and Laravel.
Nginx and PHP are both preconfigured and ready to handle your connections.

## Simple usage
Just start it with `docker run -v .:/app blunt1337/nginx-php7-laravel` to use the current path for your app.

## Custom usage
See extra configuration in the base image [blunt1337/nginx-php7](https://hub.docker.com/r/blunt1337/nginx-php7)