# KairosDB Docker

Dockerfile to run KairosDB on Cassandra. Configuration is done through environment variables.

`docker run stakater/kairosdb`

`docker run -P -e "CASS_HOSTS=192.168.1.63:9160" -e "REPFACTOR=1" stakater/kairosdb`

## Advanced

Build an image:
`docker build -t stakater/kairosdb .`

Push an image:
`sudo docker push stakater/kairosdb`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`