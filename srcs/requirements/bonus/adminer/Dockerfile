FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN printf '#! /bin/sh\nexit 0' > /usr/sbin/policy-rc.d; \
	echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y apt-transport-https \
	wget \
	lsb-release \
	ca-certificates \
	mariadb-client && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
	sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y php7.4-fpm \
	php7.4-mysqli && \
	sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf && \
	test -d /run/php || mkdir -p /run/php && \
	test -f /run/php/php7.4-fpm.pid || touch /run/php/php7.4-fpm.pid
COPY conf/conf.sh /conf.sh
RUN chmod 0777 /conf.sh
ENTRYPOINT ["/conf.sh"]
