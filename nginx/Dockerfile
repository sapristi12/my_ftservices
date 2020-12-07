FROM alpine:latest

RUN apk update \
 && apk add nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/website.pem -keyout /etc/nginx/ssl/website.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=erlajoua/CN=website"

RUN mkdir -p /run/nginx
RUN chown -R root:root /etc/nginx/ssl
RUN chmod -R 600 /etc/nginx/ssl

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./index.html /var/www/localhost/htdocs

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
