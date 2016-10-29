FROM 					stakater/base
MAINTAINER 				Rasheed Amir <rasheed@aurorasolutions.io>


# Use baseimage-docker's init system.
CMD 					["/sbin/my_init"]


# make sure the package repository is up to date
RUN 					echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN 					apt-get -y update


# install NodeJs
RUN 					curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -
RUN 					apt-get update
RUN 					apt-get -y install nodejs


# update npm to the latest version
RUN 					npm update -g npm


# install yeoman
RUN 					npm install -g yo


# install bower
RUN 					npm install -g bower


# install grunt
RUN 					npm install -g grunt-cli


# install grunt
RUN 					npm install -g gulp


# expose the grunt server port
EXPOSE 					9000


# expose the gulp port
EXPOSE 					35729


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*