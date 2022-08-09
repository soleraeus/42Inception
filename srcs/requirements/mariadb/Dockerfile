FROM debian:buster
RUN apt-get update && \
	apt-get install -y apt-utils mariadb-server && \
	test -d /var/run/mysqld || mkdir /var/run/mysqld; \
     	chmod 0777 /var/run/mysqld; \
	test -d /var/lib/mysql || mkdir /var/lib/mysql; \
     	chmod 0777 /var/lib/mysql;
ADD conf/mariadb_init.sh /conf.sh
EXPOSE 3306
ENTRYPOINT ["./conf.sh"]
CMD ["mysqld_safe"]
