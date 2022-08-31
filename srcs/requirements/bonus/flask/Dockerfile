FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y python3.7 \
	python3-pip \
	python3.7-dev \
	libffi-dev \
	gcc \
	musl-dev \
	make \
	libevent-dev && \
	pip3 install flask gunicorn gevent
COPY tools/ /cv
COPY conf.sh /conf.sh
WORKDIR /var/html/www/
ENTRYPOINT ["/conf.sh"]
