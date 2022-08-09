#! /bin/bash

sleep 2
/etc/init.d/mysql start;
mysql -uroot --password="" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;"
