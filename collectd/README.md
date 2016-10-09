# Collectd Dockerfile

based on Ubuntu 16.04

Run the latest container with:

`docker run stakater/collectd`

## Advanced

Build an image:
`docker build -t stakater/java:collectd .`

Push an image:
`sudo docker push stakater/java:collectd`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

## ToDo's

1. templatize collectd.conf - assume you have multiple servers to write to!