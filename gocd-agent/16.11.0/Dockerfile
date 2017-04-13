FROM gocd/gocd-agent-deprecated:16.11.0
MAINTAINER Hazim <hazim@aurorasolutions.io>

RUN apt-get -y update
RUN apt-get -y install wget python-pip python-dev
#Install Python -- Using latest because the rest install 3.4.2
RUN mkdir -p /etc/downloads/python
RUN mkdir -p /opt/bin
RUN rm /usr/bin/python3
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -P /etc/downloads/python
RUN chmod +x /etc/downloads/python/Miniconda3-latest-Linux-x86_64.sh
RUN /etc/downloads/python/Miniconda3-latest-Linux-x86_64.sh -bf -p /opt/python
RUN ln -s /opt/python/bin/python /usr/bin/python3
RUN ln -s /opt/python/bin/pip /usr/bin/pip3
ENV PATH $PATH:/opt/bin
RUN apt-get -y install jq uuid wget unzip
RUN pip install --upgrade awscli
#making lsb_release use python2, doesn't work with python3 at the moment
RUN sed -i -e 's/python3/python/' /usr/bin/lsb_release
RUN pip3 install --upgrade ruamel.yaml

RUN apt-get clean

# Install terraform
RUN mkdir -p /opt/terraform
RUN wget -nc -q https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip -P /opt/terraform
RUN unzip -q /opt/terraform/terraform_0.7.13_linux_amd64.zip -d /opt/terraform
ENV PATH /opt/terraform:$PATH

# base image's cmd
CMD ["/sbin/my_init"]
