#! /bin/bash

until test -f /wordpress/wordpress/wp-config.php; do
	sleep 1
done

if [ ! -f /etc/ssl/private/proftpd.key ]
then
openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=${COMPOSE_PROJECT_NAME}/CN=ftp.${WP_URL}"
useradd ${FTP_USER} --shell "/bin/false" --base-dir /wordpress/wordpress
echo "${FTP_USER}:${FTP_PWD}" | chpasswd
groupadd www-data
usermod -aG www-data ${FTP_USER}
sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/proftpd.conf"
sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/conf.d/Inception.conf"

sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/proftpd.conf"
sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/conf.d/Inception.conf"	
fi

find /wordpress/wordpress -type d -print0 | xargs -0 chmod 775
find /wordpress/wordpress -type f -print0 | xargs -0 chmod 664

exec proftpd -n -q
