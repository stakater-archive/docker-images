## node docker images

based on Ubuntu 14.04

Run the latest container with:

`docker run stakater/nodejs:with-gradle`

## Advanced

Build an image:
`docker build -t stakater/nodejs:with-gradle .`

Push an image:
`sudo docker push stakater/nodejs:with-gradle`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

## includes

* Ubuntu 14.04 LTS
* Oracle Java 8
* gradle
* nodejs 4.x
* npm
* gulp
* grunt
* yo
* bower