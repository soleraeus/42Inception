#! /bin/bash

until test -f /wordpress/wordpress/index.php; do
	sleep 1
done
useradd ${FTP_USER} --base-dir /wordpress
echo "${FTP_USER}:${FTP_PWD}" | chpasswd
groupadd www-data
usermod -aG www-data ${FTP_USER}
sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/proftpd.conf"
sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/conf.d/Inception.conf"

sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/proftpd.conf"
sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/conf.d/Inception.conf"	
find /wordpress -type d -print0 | xargs -0 chmod 775
find /wordpress -type f -print0 | xargs -0 chmod 664

exec proftpd -n -q
