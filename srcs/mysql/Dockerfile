ARG VERSION=latest

FROM alpine:$VERSION

RUN	apk update
RUN apk add --no-cache mariadb mariadb-client openrc

COPY srcs/livenessprobe.sh ./
COPY srcs/mariadb-server.cnf ./
COPY srcs/start.sh ./
COPY srcs/wordpress.sql ./

RUN rm /etc/my.cnf.d/mariadb-server.cnf
RUN mv mariadb-server.cnf /etc/my.cnf.d/
RUN	mkdir -p /run/mysqld
RUN	chmod 777 ./start.sh 

EXPOSE 3306
CMD ["/bin/ash", "start.sh"]
