#!/bin/sh

openrc
touch /run/openrc/softlevel
rc-service influxdb start
sleep 3

influx << EOF
CREATE DATABASE $IFDB_NAME;
CREATE USER $IFDB_USER WITH PASSWORD '$IFDB_PASSWORD' WITH ALL PRIVILEGES;
GRANT ALL ON $IFDB_NAME TO $IFDB_USER;
EOF

sleep infinity
wait
