#! /bin/bash

service mysql start
sleep 2
mysql -uroot --password="" < init_db.sql
mysqladmin -uroot --password=password shutdown
exec mysqld_safe
