FROM gocd/gocd-agent:16.5.0-3305
MAINTAINER Hazim <hazim@aurorasolutions.io>

RUN apt-get -y update
RUN apt-get -y install jq python-pip uuid
RUN pip install --upgrade awscli

RUN apt-get clean

# base image's cmd
CMD ["/sbin/my_init"]
