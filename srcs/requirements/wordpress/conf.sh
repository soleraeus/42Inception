#! /bin/bash

until mysql -hmariadb -uwpuser -ppassword "wordpress"; do
	sleep 2
done
echo "Connected to database"
cd /var/html/www; wp core download --allow-root; wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --dbprefix=wp_ --allow-root; wp core install --url=bdetune.42.fr --title=Inception --admin_user=Inceptioner --admin_password=TheInceptionist --admin_email=unknown@gmail.com --skip-email --allow-root
exec sleep infinity
