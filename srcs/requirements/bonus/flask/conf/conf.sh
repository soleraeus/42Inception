#! /bin/bash

rm -rf cv
mv /cv .
chown -R www-data:www-data cv
find cv -type d -print0 | xargs -0 chmod 775
find cv -type f -print0 | xargs -0 chmod 664
exec gunicorn --chdir cv --pid 1 --bind 0.0.0.0:5000 --name "${FLASK_APP_NAME}" --timeout 60 --workers 3 --worker-class gevent cv:app