ARG VERSION=latest

FROM alpine:$VERSION
RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN apk add openssl
RUN mkdir -p /tmp/nginx/client-body

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/website.pem -keyout /etc/nginx/ssl/website.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=erlajoua/CN=website"

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/default.conf /etc/nginx/conf.d/default.conf
COPY srcs/index.html /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
