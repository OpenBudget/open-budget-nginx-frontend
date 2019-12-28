#!/bin/sh
set -e

service amplify-agent start > /dev/null 2>&1

echo "NGINX STARTING"
nginx -g "daemon off;"
