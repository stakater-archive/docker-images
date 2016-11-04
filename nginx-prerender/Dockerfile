# This docker images is a combination of nginx (official) & stakater/prerender
FROM node:6
MAINTAINER hazim1093 <hazim_malik@hotmail.com>

ENV NGINX_VERSION 1.11.5-1~jessie
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-perl \
						nginx-module-njs \
						gettext-base \
  && apt-get install -y vim git supervisor \
	&& rm -rf /var/lib/apt/lists/*

# forward NGINX request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	  && ln -sf /dev/stderr /var/log/nginx/error.log

# create supervisor log directory and Prerenderer app directory
RUN mkdir -p /var/log/supervisor && \
    mkdir -p /usr/src/app

WORKDIR /usr/src/app
RUN git clone https://github.com/prerender/prerender.git && cd prerender && npm install
ENV PORT=1337

# supervisor base configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# NGINX and Prerenderer ports
EXPOSE 80 443 1337

# default command
CMD ["/usr/bin/supervisord"]