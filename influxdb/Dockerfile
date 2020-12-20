FROM alpine

RUN apk update && apk add \
	openrc \
	influxdb

COPY srcs/start.sh /root/

EXPOSE 8086

CMD ["/bin/sh", "/root/start.sh"]
