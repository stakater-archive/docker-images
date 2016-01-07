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
RUN 			apt-get -y install vim nano git sudo zip bzip2 fontconfig curl


# Configure users
RUN 			echo 'root:stakater' |chpasswd
RUN 			groupadd stakater && useradd stakater -s /bin/bash -m -g stakater -G stakater && adduser stakater sudo
RUN 			echo 'stakater:stakater' |chpasswd
RUN 			cd /home && chown -R stakater:stakater /home/stakater


# Expose the working directory
VOLUME 			["/home/stakater"]
WORKDIR			/home/stakater

# Enable ssh access to container
# see: https://github.com/phusion/baseimage-docker#login_ssh
# RUN 			rm -f /etc/service/sshd/down
# permantly add insecure key
# RUN 			/usr/sbin/enable_insecure_key

# use your own key (when using this comment out the insecure key statement)
# see: https://github.com/phusion/baseimage-docker#using_your_own_key
# ADD .config/ssh/your_key.pub /tmp/your_key.pub
# RUN cat /tmp/your_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/your_key.pub


# Use baseimage-docker's init system.
# CMD 			["/sbin/my_init"]


#####
# Phusion: Clean up APT when done.
#####
RUN 			apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*