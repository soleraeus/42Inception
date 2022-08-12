#! /bin/bash

until mysql -hmariadb -uwpuser -ppassword "wordpress" 2> /dev/null; do
	sleep 2
done
echo "Connected to database"
test -d /run/php || mkdir -p /run/php
test -f /run/php || touch /run/php/php7.4-fpm.pid
cd /var/html/www; wp core download --allow-root 2> /dev/null; wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --dbprefix=wp_ --allow-root 2> /dev/null; wp core install --url=bdetune.42.fr --title=Inception --admin_user=Inceptioner --admin_password=TheInceptionist --admin_email=unknown@gmail.com --skip-email --allow-root
exec /usr/sbin/php-fpm7.4 -F
