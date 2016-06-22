FROM gocd/gocd-agent:16.5.0-3305
MAINTAINER hazim1093 <hazim_malik@hotmail.com>

# Install build essential for `make`
RUN apt-get update && apt-get install -y wget unzip build-essential

# Install terraform
RUN mkdir -p /opt/terraform
RUN wget -nc -q https://releases.hashicorp.com/terraform/0.6.12/terraform_0.6.12_linux_amd64.zip -P /opt/terraform
RUN unzip -q /opt/terraform/terraform_0.6.12_linux_amd64.zip -d /opt/terraform
ENV PATH $PATH:/opt/terraform

# base image's cmd
CMD ["/sbin/my_init"]
