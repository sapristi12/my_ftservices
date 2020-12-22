ARG VERSION=latest

FROM alpine:$VERSION

RUN	apk update
RUN apk add --no-cache vsftpd openssl bash

COPY srcs/start.sh ./
COPY srcs/vsftpd.conf ./
COPY srcs/vsftpd.pem ./

RUN	mkdir /etc/certs
RUN mv vsftpd.conf /etc/vsftpd.conf
RUN mv vsftpd.pem /vsftpd.pem

RUN	chmod 777 start.sh 
EXPOSE	20 21 20010 20011

CMD	["./start.sh"]
