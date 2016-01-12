FROM 					stakater/tomcat:8
MAINTAINER 				Rasheed Amir <rasheed@aurorasolutions.io>


# Use baseimage-docker's init system.
CMD 					["/sbin/my_init"]


# make sure the package repository is up to date
RUN 					echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN 					apt-get -y update


# install http-server
WORKDIR 				/tomcat
RUN 					rm -Rf webapps/*
RUN						wget https://github.com/swagger-api/swagger-editor/releases/download/v2.9.8/swagger-editor.zip
RUN						mv *.zip webapps/ROOT.war

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*