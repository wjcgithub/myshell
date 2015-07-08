#!/bin/bash

cd /var/www/demo/api_log
mkdir -p a/b/c
#find . -type d -mtime +30 -exec rm -f {} \;

cd /var/www/demo/api_log
mkdir -p c/d/e

for (( i = 0; i < 10; i++ )); do
	#statements
done

while [[ condition ]]; do
	#statements
done