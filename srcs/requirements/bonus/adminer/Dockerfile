FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y apt-transport-https \
	wget \
	lsb-release \
	ca-certificates \
	curl \
	mariadb-client && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
	sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && \
	apt-get update && \
	apt-get install -y php7.4-fpm \
	php7.4-mysqli && \
	sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf && \
	test -d /run/php || mkdir -p /run/php && \
	test -f /run/php || touch /run/php/php7.4-fpm.pid
COPY conf.sh /conf.sh
ENTRYPOINT ["/conf.sh"]
