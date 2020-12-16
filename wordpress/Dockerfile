ARG VERSION=latest

FROM alpine:$VERSION

COPY wp-config.php setup.sh ./

RUN apk update && \
	apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

COPY latest.tar.gz .

RUN tar -xvf latest.tar.gz && \
	mv wordpress /www && \
	mv wp-config.php /www/ && \
	rm -f latest.tar.gz
EXPOSE 5050

RUN chmod +x setup.sh

CMD ./setup.sh
