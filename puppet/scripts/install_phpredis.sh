#!/bin/bash

cd /tmp
git clone https://github.com/nicolasff/phpredis.git
cd phpredis/
phpize
./configure
make && make install
echo "extension=redis.so" > /etc/php5/mods-available/redis.ini
php5enmod redis

# Restart Apache
/etc/init.d/apache2 restart
