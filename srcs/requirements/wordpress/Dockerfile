FROM debian:buster
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
	apt-get install -y php7.4 \
	php7.4-fpm \
	php7.4-cli \
	php7.4-bcmath \
	php7.4-common \
	php7.4-curl \
	php7.4-gd \
	php7.4-intl \
	php7.4-json \
	php7.4-mbstring \
	php7.4-mysqli \
	php7.4-opcache \
	php7.4-readline \
	php7.4-xml \
	php7.4-xmlrpc \
	php7.4-xsl \
	php7.4-zip && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp
COPY conf.sh conf.sh
ENTRYPOINT ./conf.sh
