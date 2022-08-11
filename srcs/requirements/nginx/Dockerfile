FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y nginx
COPY conf.sh conf.sh
ENTRYPOINT ./conf.sh
