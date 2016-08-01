FROM phusion/baseimage:0.9.19
MAINTAINER Rasheed Amir <rasheed@aurorasolutions.io>

RUN echo "deb http://archive.ubuntu.com/ubuntu xenial main universe" > /etc/apt/sources.list
RUN apt-get -y update

RUN apt-get -y install sudo nano git sudo zip bzip2 fontconfig wget

RUN echo 'root:stakater' |chpasswd
RUN groupadd stakater && useradd stakater -s /bin/bash -m -g stakater -G stakater && adduser stakater sudo
RUN echo 'stakater:stakater' |chpasswd
RUN cd /home && chown -R stakater:stakater /home/stakater

# install NodeJs
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get update
RUN apt-get -y install nodejs

# install yeoman
RUN npm -g install npm
RUN npm install -g yo
RUN npm install -g generator-generator

RUN \

	# fix stakater user permissions
	chown -R stakater:stakater \
		/home/stakater \
		/usr/lib/node_modules && \

	# cleanup
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* \
	/tmp/* \
	/var/tmp/*