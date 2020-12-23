ARG VERSION=latest

FROM alpine:$VERSION

RUN apk update
RUN apk add openrc influxdb

COPY srcs/start.sh /root/

EXPOSE 8086
CMD ["/bin/sh", "/root/start.sh"]
