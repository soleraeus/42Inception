FROM debian:buster
RUN apt-get update && \
	apt-get install -y apt-utils mariadb-server && \
	test -d /var/run/mysqld || mkdir /var/run/mysqld; \
     	chmod 0777 /var/run/mysqld; \
	test -d /var/lib/mysql || mkdir /var/lib/mysql; \
     	chmod 0777 /var/lib/mysql; \
	/etc/init.d/mysql start; \
	mysql -uroot -p="password" -e "CREATE DATABASE wordpress;GRANT ALL ON wordpress.* to 'root' IDENTIFIED BY 'password'"; \
	mysql -uroot --password="" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;"
EXPOSE 3306
COPY conf.sh conf.sh
ENTRYPOINT ./conf.sh
