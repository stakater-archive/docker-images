FROM gocd/gocd-agent:16.5.0-3305
MAINTAINER Hazim <hazim@aurorasolutions.io>

RUN apt-get -y update
RUN apt-get -y install jq python-pip uuid wget unzip
RUN pip install --upgrade awscli

RUN apt-get clean

# Install terraform 
RUN mkdir -p /opt/terraform
RUN wget -nc -q https://releases.hashicorp.com/terraform/0.7.3/terraform_0.7.3_linux_amd64.zip -P /opt/terraform
RUN unzip -q /opt/terraform/terraform_0.7.3_linux_amd64.zip -d /opt/terraform
RUN mkdir -p /etc/profile.d
RUN echo PATH=$PATH:/opt/terraform > /etc/profile.d/terraform.sh

# base image's cmd
CMD ["/sbin/my_init"]
