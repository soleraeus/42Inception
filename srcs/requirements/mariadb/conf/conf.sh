#! /bin/bash

service mysql start 2> /dev/null
sleep 1
mysql -uroot --password="" < init_db.sql 2> /dev/null || echo "Database already present, reusing data"
mysqladmin -uroot --password=password shutdown 2> /dev/null
exec mysqld_safe
