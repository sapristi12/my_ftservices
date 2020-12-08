FROM alpine:3

RUN	apk update && apk add --no-cache php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring \
	php7-json php7-session

RUN mkdir www \
	&& chmod 775 www

ADD srcs/wordpress-5.4.1-fr_FR.tar.gz www/

COPY srcs/wp-config.php www/wordpress/

EXPOSE 5050

CMD ["php", "-S", "0.0.0.0:5050", "-t", "/www/wordpress/"]
