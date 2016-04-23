FROM 					stakater/java:oracle-8
MAINTAINER 				Rasheed Amir <rasheed@aurorasolutions.io>

RUN 					apt-get update && \
    					apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    					apt-get clean && \
    					rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7
RUN set -x \
	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true

# Set default Logstash version
ENV 					LOGSTASH_VERSION 2.3.1-1_all

RUN 					wget https://download.elastic.co/logstash/logstash/packages/debian/logstash_${LOGSTASH_VERSION}.deb -O /tmp/logstash.deb && \
    					dpkg -i /tmp/logstash.deb ; \
    					apt-get -f -y install && \
    					rm -rf /tmp/logstash.deb && \
    					/opt/logstash/bin/plugin install logstash-input-beats && \
    					/opt/logstash/bin/plugin install logstash-filter-grok && \
    					/opt/logstash/bin/plugin install logstash-output-elasticsearch && \
    					/opt/logstash/bin/plugin install logstash-output-email && \
    					/opt/logstash/bin/plugin install logstash-output-hipchat


ENV 					PATH /opt/logstash/bin:$PATH

COPY 					docker-entrypoint.sh /

ENTRYPOINT 				["/docker-entrypoint.sh"]
CMD 					["logstash", "agent"]
