#! /bin/bash

/etc/init.d/php-fpm start
#mysql -uroot -p="password" -e "CREATE DATABASE wordpress;GRANT ALL ON wordpress.* to 'root' IDENTIFIED BY 'password'"
cd /var/html/www && wp core is-installed --allow-root || wp core download --allow-root && wp config create --dbname=wordpress --dbuser=root --dbpass=password --dbhost=localhost --dbprefix=wp_ --allow-root && wp core install --allow-root
/etc/init.d/php-fpm stop
exec php-fpm -F
