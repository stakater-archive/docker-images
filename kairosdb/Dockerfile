# Dockerfile to run KairosDB on Cassandra. Configuration is done through environment variables.
#
# The following environment variables can be set
#
#     $CASS_HOSTS           [kairosdb.datastore.cassandra.host_list] (default: localhost:9160)
#                           Cassandra seed nodes (host:port,host:port)
#
#     $REPFACTOR            [kairosdb.datastore.cassandra.replication_factor] (default: 1)
#                           Desired replication factor in Cassandra
#
#     $PORT_TELNET          [kairosdb.telnetserver.port] (default: 4242)
#                           Port to bind for telnet server
#
#     $PORT_HTTP            [kairosdb.jetty.port] (default: 8080)
#                           Port to bind for http server
#
# Sample Usage:
#                  docker run -P -e "CASS_HOSTS=192.168.1.63:9160" -e "REPFACTOR=1" stakater/kairosdb

FROM 				stakater/java:oracle-8

MAINTAINER 			Rasheed Amir <rasheed@aurorasolutions.io>

# Install KAIROSDB
RUN 				wget -O /var/cache/kairosdb_1.1.2-1_all.deb \ 
					https://github.com/kairosdb/kairosdb/releases/download/v1.1.2/kairosdb_1.1.2-1_all.deb

RUN 				dpkg -i /var/cache/kairosdb_1.1.2-1_all.deb

ADD 				kairosdb.properties /opt/kairosdb/conf/kairosdb.properties

ADD 				run.sh /usr/local/sbin/run_kairosdb.sh

ADD 				logback.xml /opt/kairosdb/conf/logging/logback.xml

ENTRYPOINT 			["/usr/local/sbin/run_kairosdb.sh"]