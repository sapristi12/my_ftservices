FROM alpine

RUN apk update && apk add \
	wget

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.3.linux-amd64.tar.gz \
	&& tar -zxf grafana-7.3.3.linux-amd64.tar.gz \
	&& mv grafana-7.3.3 grafana \
	&& rm grafana-7.3.3.linux-amd64.tar.gz
	
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY srcs/datasource.yaml grafana/conf/provisioning/datasources/
COPY srcs/dashboard.yaml grafana/conf/provisioning/dashboards/
COPY srcs/dashboard.json var/lib/grafana/dashboards/

COPY srcs/start.sh /root/

EXPOSE 3000

CMD ["/bin/sh", "/root/start.sh"]
