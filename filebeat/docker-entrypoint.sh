#!/bin/sh
set -e

# Render config file
cat /etc/filebeat/filebeat.yml | sed "s/LOGSTASH_HOST/$LOGSTASH_HOST/" | sed "s/LOGSTASH_PORT/$LOGSTASH_PORT/" > /etc/filebeat/filebeat.yml.tmp
cat /etc/filebeat/filebeat.yml.tmp > /etc/filebeat/filebeat.yml
rm /etc/filebeat/filebeat.yml.tmp

exec "$@"