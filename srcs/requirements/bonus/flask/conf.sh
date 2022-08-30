#! /bin/bash

test -d cv || mkdir cv
test -f cv/hello.py || cp /hello.py cv/hello.py
cd cv && exec python3.7 -m flask run --host=0.0.0.0
