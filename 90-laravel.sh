#!/bin/bash
set -e

# Install some php extension
apk add --update bash
apk add --update php7
apk add --update php7-tokenizer
apk add --update php7-xml
apk add --update php7-zlib
apk add --update php7-ctype
apk add --update php7-fileinfo
apk add --update php7-sockets
apk add --update php7-dom
apk add --update php7-phar
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
mv composer.phar /usr/bin/composer
php -r "unlink('composer-setup.php');"
composer self-update

# Add the rewrite rules
echo '
location / {
	try_files $uri /index.php?$query_string;
}
error_page 404 /index.php;
' > /etc/nginx/locations/90-laravel.conf