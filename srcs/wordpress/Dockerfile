ARG VERSION=latest

FROM alpine:$VERSION

RUN apk update
RUN apk add --no-cache bash nginx php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

COPY srcs/latest.tar.gz ./
COPY srcs/nginx.conf ./
COPY srcs/start.sh ./
COPY srcs/wp-config.php ./
COPY srcs/www.conf ./

RUN mv nginx.conf /etc/nginx/nginx.conf
RUN mv www.conf /etc/php7/php-fpm.d/www.conf 
RUN chmod -R 777 /var/log/nginx && chmod 777 start.sh
RUN mkdir -p /var/www && mkdir -p /run/nginx && mkdir -p /run/php && mkdir -p /run/wordpress && mkdir -p /var/run
RUN tar -xvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN chmod 777 -R /wordpress
RUN mv wp-config.php /wordpress/wp-config.php
RUN mv /wordpress/* /var/www/.

EXPOSE 5050
CMD ["./start.sh"]
