ARG VERSION=latest

FROM alpine:$VERSION

RUN apk update
RUN apk add vsftpd openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=PARIS/L=PARIS/O=L/CN=localhost" \
    -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
	
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/start.sh /root
RUN mkdir -p /home/ftp/admin/
RUN touch /home/ftp/admin/monfichier

EXPOSE 20 21 21000-21005
CMD ["/bin/sh", "/root/start.sh"]
