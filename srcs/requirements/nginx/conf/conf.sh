#! /bin/bash

if [ $BONUS ]
then
	cd /tools; chmod 777 *; for f in *; do bash "$f"; done;
else
	cd /tools; chmod 777 wp.sh; ./wp.sh;
fi

exec nginx
