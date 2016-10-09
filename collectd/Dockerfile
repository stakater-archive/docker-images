FROM 				stakater/base:latest
MAINTAINER 			Rasheed Amir <rasheed@aurorasolutions.io>

RUN 				apt-get update && \
      				apt-get install collectd --no-install-recommends -y

RUN 				wget -O /usr/lib/collectd/kairosdb_writer.py \
      				https://raw.githubusercontent.com/kairosdb/collectd-kairosdb/master/kairosdb_writer.py

ADD 				collectd.conf /etc/collectd/collectd.conf

RUN 				service collectd stop

RUN 				rm -f /etc/init/collectd.conf
RUN 				rm -f /etc/init.d/collectd

ADD 				run.sh /usr/local/sbin/run_collectd.sh
ENTRYPOINT 			["/usr/local/sbin/run_collectd.sh"]