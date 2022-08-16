#! /bin/bash

if [ ! -f init_db.sql ]
then
cat <<EOF >init_db.sql
DROP DATABASE IF EXISTS test;
DROP USER IF EXISTS ''@'localhost';
CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PWD}';
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}';
FLUSH PRIVILEGES;
EOF

service mysql start 2> /dev/null
sleep 1
mysql -uroot --password="" < init_db.sql 2> /dev/null || echo "Reusing already present database"
mysqladmin -uroot --password="${MARIADB_ROOT_PWD}" shutdown 2> /dev/null
fi
exec mysqld_safe
