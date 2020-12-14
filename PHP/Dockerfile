ARG VERSION=latest

FROM alpine:$VERSION

ADD srcs/phpMyAdmin-4.9.0.1-all-languages.tar.gz .

RUN apk update && apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN mkdir www/
RUN chmod 775 www/
RUN mv /phpMyAdmin-4.9.0.1-all-languages/* www/

COPY srcs/config.inc.php www/

CMD ["php", "-S", "0.0.0.0:5000", "-t", "/www"]
