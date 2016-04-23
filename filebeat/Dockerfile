FROM 					stakater/base
MAINTAINER 				Rasheed Amir <rasheed@aurorasolutions.io>

RUN 					apt-get update && \
    					apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    					apt-get clean && \
    					rm -rf /var/lib/apt/lists/*

RUN 					curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.2.1_amd64.deb
RUN 					dpkg -i filebeat_1.2.1_amd64.deb

COPY 					docker-entrypoint.sh /docker-entrypoint.sh
COPY 					filebeat.yml /etc/filebeat/filebeat.yml

ENTRYPOINT 				["/docker-entrypoint.sh"]

RUN 					apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD 					["/usr/bin/filebeat", "-c", "/etc/filebeat/filebeat.yml"]