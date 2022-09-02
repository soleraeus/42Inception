FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN printf '#! /bin/sh\nexit 0' > /usr/sbin/policy-rc.d; \
	echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; \
	apt-get update && \
	apt-get install -y python3.7 \
	python3-pip \
	python3.7-dev \
	libffi-dev \
	gcc \
	musl-dev \
	make \
	libevent-dev \
	python-gevent \
	python-markupsafe && \
	pip3 install setuptools; \
	pip3 install flask gunicorn; \
	pip3 install --upgrade markupsafe gevent
COPY tools/ /cv
COPY conf/conf.sh /conf.sh
RUN chmod 0777 /conf.sh
WORKDIR /var/html/www/
ENTRYPOINT ["/conf.sh"]
