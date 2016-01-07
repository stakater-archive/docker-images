## tomcat 8 docker image

based on Ubuntu 14.04 and Oracle Java 8

Run the latest container with:

`docker run stakater/tomcat:8`

## Advanced

Build an image:
`docker build -t stakater/tomcat:8 .`

Push an image:
`sudo docker push stakater/tomcat:8`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`