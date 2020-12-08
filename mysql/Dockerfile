FROM alpine:3

RUN	apk update && apk add --no-cache mariadb mariadb-client

COPY srcs/mariadb-server.cnf /etc/my.cnf.d/
COPY srcs/cr_user.sql .
COPY srcs/wordpress.sql .
COPY srcs/create_tables.sql .
COPY srcs/setup.sh .
COPY srcs/cr_tables.sh .

CMD ["sh","setup.sh"]
