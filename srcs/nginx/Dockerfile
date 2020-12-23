ARG VERSION=latest

FROM alpine:$VERSION

RUN apk update
RUN apk add --no-cache nginx openssl bash

COPY srcs/nginx.conf ./
COPY srcs/nginx.crt ./
COPY srcs/nginx.key ./
COPY srcs/start.sh ./
COPY srcs/index.html ./
COPY srcs/logogit.png ./
COPY srcs/style.css ./

RUN mv nginx.conf /etc/nginx/nginx.conf
RUN mv nginx.crt /etc/nginx/nginx.crt
RUN mv nginx.key /etc/nginx/nginx.key

RUN chmod 777 ./start.sh
RUN chmod -R 777 /var/log/nginx

RUN mkdir -p /run/nginx
RUN mv index.html /var/www/
RUN mv style.css /var/www/
RUN mv logogit.png /var/www/

EXPOSE 80 443
CMD ["./start.sh"]
