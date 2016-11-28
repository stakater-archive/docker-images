FROM 				stakater/nginx:latest

MAINTAINER          Rasheed Amir <rasheed@aurorasolutions.io>

# setting a default value to make it work on dockerhub
ARG                 CONSUL_TEMPLATE_VERSION=0.16.0

# remove all default configurations from Nginx
# RUN 				rm -v /etc/nginx/conf.d/*.conf

# we define an environment variable with the location of our Consul cluster. By default, it will try to resolve to
# consul:8500 which would be the behavior if we have Consul running as a container in the same host and we link it to this 
# Nginx container (with the alias consul, of course). But this environment variable can also be overridden when we run the 
# container if we want to point somewhere else. 

ENV 				CONSUL_URL consul:8500

# download the latest version of Consul Template and we put it on /usr/local/bin

ADD 				https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /usr/bin/
RUN 				unzip /usr/bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip

# we define a volume /templates, which is where we will mount our template files from the host. This way we can reuse 
# the same image for different services and templates.

VOLUME 				/templates

# add the start up script (which is used as the entrypoint to our containers) 

ADD 				start.sh /bin/start.sh

# our container will expose port 80, where Nginx will be listening for new connections

EXPOSE 				80

# entrypoint will be the /bin/start.sh 

ENTRYPOINT 			["/bin/start.sh"]