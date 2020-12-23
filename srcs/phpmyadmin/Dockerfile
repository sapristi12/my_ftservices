ARG VERSION=latest

FROM alpine:$VERSION

RUN	apk update
RUN apk add --no-cache openssl nginx procps php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session phpmyadmin bash

COPY srcs/config.inc.php ./
COPY srcs/nginx.conf ./
COPY srcs/nginx.crt ./
COPY srcs/nginx.key ./
COPY srcs/start.sh ./
COPY srcs/www.conf ./

RUN mv nginx.conf /etc/nginx/
RUN	mv nginx.crt /etc/nginx/nginx.crt
RUN	mv nginx.key /etc/nginx/nginx.key
RUN	mv www.conf /etc/php7/php-fpm.d/www.conf 
RUN cp config.inc.php /etc/phpmyadmin/config.inc.php
RUN	chmod 777 ./start.sh
RUN	chmod 777 -R /usr/share/webapps/phpmyadmin
RUN	chmod -R 777 /var/log/nginx
RUN	mkdir -p /var/www && mkdir -p /run/nginx && mkdir -p /run/php && mkdir -p /run/phpmyadmin && mkdir -p /var/run/
RUN	mv /usr/share/webapps/phpmyadmin/* /var/www/.

EXPOSE 5000
CMD	["./start.sh"]
