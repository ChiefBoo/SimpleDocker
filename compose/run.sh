#!/bin/bash

#part 6
service nginx start
nginx -s reload

while true; do
	sleep 1
done

