#! /bin/bash

cd /usr/local/go/src; \
	test -d cadvisor && (cd cadvisor && git pull) || git clone https://github.com/google/cadvisor.git cadvisor; \
	cd cadvisor; \
	make build; \
	cp _output/cadvisor /usr/local/bin; \
	chmod 777 /usr/local/bin/cadvisor;
exec cadvisor
