FROM phusion/baseimage:0.9.18
MAINTAINER hazim1093 <hazim_malik@hotmail.com>

# Install build essential for `make`
RUN apt-get update && apt-get install -y wget python-pip jq git unzip build-essential
RUN pip install --upgrade awscli s3cmd

# Install terraform
ENV TERRAFORM_VERSION 0.7.2
RUN mkdir -p /opt/terraform
RUN wget -nc -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -P /opt/terraform
RUN unzip -q /opt/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /opt/terraform
ENV PATH $PATH:/opt/terraform

# Make directory which will contain the terraform project and expose as volume
RUN mkdir -p /usr/src/app
VOLUME /usr/src/app

# Change working directory
WORKDIR /usr/src/app
