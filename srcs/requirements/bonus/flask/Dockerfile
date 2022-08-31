FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y python3.7 \
	python3-pip && \
	pip3 install flask gunicorn
COPY tools/ /cv
COPY conf.sh /conf.sh
WORKDIR /var/html/www/
ENTRYPOINT ["/conf.sh"]
