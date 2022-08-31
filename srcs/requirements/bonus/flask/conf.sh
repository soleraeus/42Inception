#! /bin/bash

rm -rf cv
mv /cv cv
find cv -type d -print0 | xargs -0 chmod 775
find cv -type f -print0 | xargs -0 chmod 664
cd cv; exec gunicorn --bind 0.0.0.0:5000 cv:app
