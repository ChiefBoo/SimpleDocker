#part 4
#FROM nginx
#WORKDIR /home/
#COPY ./server/nginx.conf /etc/nginx/nginx.conf
#COPY ./server/server.c .
#COPY ./run.sh .
#RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev
#ENTRYPOINT ["sh", "./run.sh"]

#part 5 and 6
FROM nginx
WORKDIR /home/
COPY ./server/nginx.conf /etc/nginx/nginx.conf
COPY ./server/server.c /home/server.c
COPY ./run.sh /home/run.sh
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
	apt-get clean; \
	chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
	rm -rf /var/lib/apt/lists/*
USER nginx
ENTRYPOINT ["sh", "./run.sh"]
HEALTHCHECK NONE
