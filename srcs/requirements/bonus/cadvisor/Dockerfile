FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y software-properties-common \
	wget \
	tar \
	git \
	gcc \
	make; \
	wget https://go.dev/dl/go1.19.linux-amd64.tar.gz; \
	tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz; \
	echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile; \
	echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc;
#	cd /usr/local/go/src; \
#	git clone https://github.com/google/cadvisor.git cadvisor; \
#	cd cadvisor; \
#	make build; \
#	cp _output/cadvisor /usr/local/bin; \
#	chmod 777 /usr/local/bin/cadvisor;
COPY conf.sh /conf.sh
ENTRYPOINT ["/conf.sh"]
