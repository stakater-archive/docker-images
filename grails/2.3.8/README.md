## Base Docker Image

based on Ubuntu 14.04 and Oracle Java 8

Run the latest container with:

`docker run stakater/grails:2.3.8`

OR

`docker run --name stakater_grails --rm -i -t stakater/grails:2.3.8 bash`

This will create a container named stakater_grails and start a Bash session.

## Advanced

Build an image:
`docker build -t stakater/grails:2.3.8 .`

Push an image:
`sudo docker push stakater/grails:2.3.8`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`