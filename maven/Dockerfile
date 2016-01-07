FROM 					stakater/java:oracle-8
MAINTAINER 				Rasheed Amir <rasheed@aurorasolutions.io>


# Use baseimage-docker's init system.
CMD 					["/sbin/my_init"]


# make sure the package repository is up to date
RUN 					echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN 					apt-get -y update


# install maven
RUN 					apt-get -y install maven