FROM debian:buster
RUN apt-get update && \
	apt-get install -y procps mariadb-server && \
	test -d /var/run/mysqld || mkdir /var/run/mysqld; \
     	chmod 0777 /var/run/mysqld; \
	test -d /var/lib/mysql || mkdir /var/lib/mysql; \
     	chmod 0777 /var/lib/mysql
EXPOSE 3306
COPY conf.sh conf.sh
COPY ./tools/init_db.sql /init_db.sql
ENTRYPOINT ./conf.sh
