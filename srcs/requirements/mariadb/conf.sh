#! /bin/bash

#test /var/lib/mysql/wordpress || mysql -uroot --password="password" -e "CREATE USER 'maria_wordpress'@'localhost' IDENTIFIED BY 'password'; CREATE DATABASE wordpress; GRANT ALL ON wordpress.* to 'maria_wordpress' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;"
exec mysqld_safe
