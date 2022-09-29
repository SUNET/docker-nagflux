#!/usr/bin/env bash

if [ "x${INFLUXDB_HOST}" == "x" ]; then
	INFLUXDB_HOST="influxdb"
fi

if [ "x${INFLUXDB_PASSWORD}" == "x" ]; then
	INFLUXDB_PASSWORD="PASSWORD"
fi

sed -i -e "s/%%HOSTNAME%%/${INFLUXDB_HOST}/g" \
       -e "s/%%PASSWORD%%/${INFLUXDB_PASSWORD}/g" \
       /config.gcfg

/nagflux -configPath=/config.gcfg
