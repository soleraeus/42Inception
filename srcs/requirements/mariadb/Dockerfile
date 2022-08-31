FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN printf '#! /bin/sh\nexit 0' > /usr/sbin/policy-rc.d; \
	echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y mariadb-server && \
	test -d /var/run/mysqld || mkdir /var/run/mysqld; \
     	chmod 0777 /var/run/mysqld; \
	test -d /var/lib/mysql || mkdir /var/lib/mysql; \
     	chmod 0777 /var/lib/mysql
COPY ./conf/my.cnf /root/.my.cnf
COPY ./conf/conf.sh conf.sh
ENTRYPOINT ["/conf.sh"]
