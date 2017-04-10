FROM gocd/gocd-agent:16.11.0
MAINTAINER Hazim <hazim@aurorasolutions.io>

RUN apt-get -y update
RUN apt-get -y install jq python3-pip uuid wget unzip
RUN pip3 install --upgrade awscli setuptools ruamel.yaml

RUN apt-get clean

# Install terraform
RUN mkdir -p /opt/terraform
RUN wget -nc -q https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip -P /opt/terraform
RUN unzip -q /opt/terraform/terraform_0.7.13_linux_amd64.zip -d /opt/terraform
ENV PATH /opt/terraform:$PATH

# base image's cmd
CMD ["/sbin/my_init"]
