FROM 					stakater/java:oracle-8
MAINTAINER 				Rasheed Amir <rasheed@aurorasolutions.io>


RUN 					apt-get update && \
    					apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    					apt-get clean && \
    					rm -rf /var/lib/apt/lists/*


ENV 					TOMCAT_MAJOR_VERSION 8
ENV 					TOMCAT_MINOR_VERSION 8.0.11
ENV 					CATALINA_HOME /tomcat


# INSTALL TOMCAT
RUN 					wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    					wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    					tar zxf apache-tomcat-*.tar.gz && \
    					rm apache-tomcat-*.tar.gz && \
    					mv apache-tomcat* tomcat

ADD 					create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
RUN 					mkdir /etc/service/tomcat
ADD 					run.sh /etc/service/tomcat/run
RUN 					chmod +x /*.sh
RUN 					chmod +x /etc/service/tomcat/run

EXPOSE 					8080

# Use baseimage-docker's init system.
CMD 					["/sbin/my_init"]
