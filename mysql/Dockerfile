ARG VERSION=latest

FROM alpine:$VERSION

COPY srcs/wpdb ./
COPY srcs/wordpress.sql ./
COPY srcs/my.cnf ./
COPY srcs/setup.sh ./
# telegraf.conf

# Install MySQL and dependencies
RUN apk update && \
	apk add --no-cache mysql mysql-client

# Setup MySQL
RUN mkdir -p /run/mysqld
RUN mv my.cnf /etc/

# Install telegraf
#RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ telegraf && \
#	mkdir -p /etc/telegraf
# && \
#	mv telegraf.conf /etc/telegraf/

EXPOSE 3306

CMD ./setup.sh
