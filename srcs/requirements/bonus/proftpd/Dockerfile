FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y proftpd \
	openssl && \
	test /wordpress || mkdir /wordpress &&\
	echo "/bin/false" >> /etc/shells
COPY conf/conf.sh /conf.sh
COPY conf/proftpd.conf /etc/proftpd/proftpd.conf
COPY conf/Inception.conf /etc/proftpd/conf.d/Inception.conf
COPY conf/tls.conf /etc/proftpd/tls.conf
ENTRYPOINT ["/conf.sh"]
