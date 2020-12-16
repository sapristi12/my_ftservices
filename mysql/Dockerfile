ARG VERSION=latest

FROM alpine:$VERSION

COPY srcs/wpdb ./
COPY srcs/wordpress.sql ./
COPY srcs/my.cnf ./
COPY srcs/setup.sh ./

RUN apk update
RUN apk add --no-cache mysql mysql-client

RUN mkdir -p /run/mysqld
RUN mv my.cnf /etc/


EXPOSE 3306

CMD ./setup.sh
