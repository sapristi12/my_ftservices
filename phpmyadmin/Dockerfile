FROM alpine:3

ADD srcs/phpMyAdmin-4.9.5-english.tar.gz .

RUN	apk update && apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
	&& mkdir www/ \
	&& chmod 775 www/ \
	&& mv /phpMyAdmin-4.9.5-english/* www/

COPY srcs/config.inc.php www/

CMD ["php","-S", "0.0.0.0:5000", "-t", "/www"]
