############################################################
# Base Docker Image
############################################################

# From & maintainer
FROM 			phusion/baseimage:0.9.17
MAINTAINER 		Rasheed Amir <rasheed@aurorasolutions.io>


# Make sure the package repository is up to date
RUN 			echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN 			apt-get -y update


# Install python-software-properties (so you can do add-apt-repository)
RUN 			DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common


# Install utilities
RUN 			apt-get -y install vim nano git sudo zip bzip2 fontconfig curl wget


# Configure users
RUN 			echo 'root:stakater' |chpasswd
RUN 			groupadd stakater && useradd stakater -s /bin/bash -m -g stakater -G stakater && adduser stakater sudo
RUN 			echo 'stakater:stakater' |chpasswd
RUN 			cd /home && chown -R stakater:stakater /home/stakater


# Expose the working directory
VOLUME 			["/home/stakater"]


# Use baseimage-docker's init system.
# CMD 			["/sbin/my_init"]


#####
# Phusion: Clean up APT when done.
#####
RUN 			apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
