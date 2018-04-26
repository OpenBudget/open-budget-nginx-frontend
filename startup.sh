#!/bin/sh
set -e

echo "HELLO WORLD!"
ls -la /var/datapackages 
chmod 777 /var/datapackages 

echo "NGINX STARTING"
nginx -g "daemon off;"
