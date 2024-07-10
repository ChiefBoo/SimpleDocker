#!/bin/bash

#part 4 and 5
# gcc -o server server.c -lfcgi
# spawn-fcgi -p 8080 ./server
# service nginx start
# /bin/bash

#part 6

gcc -o server server.c -lfcgi
service nginx start
nginx -s reload
spawn-fcgi -p 8080 -n server