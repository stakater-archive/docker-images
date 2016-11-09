FROM stakater/tomcat:8
MAINTAINER hazim1093 <hazim_malik@hotmail.com>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates supervisor && \
  	apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor
# supervisor base configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.2.1_amd64.deb
RUN dpkg -i filebeat_1.2.1_amd64.deb

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh
COPY filebeat.yml /etc/filebeat/filebeat.yml

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
# default command
CMD ["/usr/bin/supervisord"]