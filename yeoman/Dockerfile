FROM phusion/baseimage:0.9.19
MAINTAINER Rasheed Amir <rasheed@aurorasolutions.io>

RUN echo "deb http://archive.ubuntu.com/ubuntu xenial main universe" > /etc/apt/sources.list
RUN apt-get -y update

RUN apt-get -y install sudo nano git sudo zip bzip2 fontconfig wget

# install NodeJs
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get update
RUN apt-get -y install nodejs

# install yeoman
RUN npm -g install npm
RUN npm install -g yo

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*