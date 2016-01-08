## node docker images

based on Ubuntu 14.04

Run the latest container with:

`docker run stakater/nodejs:with-maven`

## Advanced

Build an image:
`docker build -t stakater/nodejs:with-maven .`

Push an image:
`sudo docker push stakater/nodejs:with-maven`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

## includes

* Ubuntu 14.04 LTS
* Oracle Java 8
* maven
* nodejs 4.x
* npm
* gulp
* grunt
* yo
* bower