FROM debian:buster
RUN apt-get update && apt-get install -y \
	apt-utils \
	mariadb-server
ADD conf/mariadb_init.sh /conf.sh
RUN test -d /var/run/mariadb || mkdir /var/run/mariadb; \
    chmod 0777 /var/run/mariadb; \
    /usr/bin/mysqld_safe --basedir=/usr & \
    sleep 10s && \
    /usr/bin/mysqladmin -u root password 'redhat'
#COPY ./conf/mariadb_init.sh /var/lib/mysql
EXPOSE 3306
#ENTRYPOINT ["./conf.sh"]
CMD test -d /var/run/mariadb || mkdir /var/run/mariadb; chmod 0777 /var/run/mariadb;/usr/bin/mysqld_safe --basedir=/usr
