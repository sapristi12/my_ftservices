ARG VERSION=latest

FROM alpine:$VERSION

RUN apk update && apk add wget

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz \
	&& tar -zxf telegraf-1.16.2_linux_amd64.tar.gz \
	&& mv telegraf-1.16.2 telegraf \
	&& rm telegraf-1.16.2_linux_amd64.tar.gz

RUN cp -rf telegraf/etc/* /etc \
	&& cp -rf telegraf/usr/* /usr

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY srcs/start.sh /root/start.sh
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8125

CMD ["/bin/sh", "root/start.sh"]

