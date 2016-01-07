## Base Docker Image

based on Ubuntu 14.04

Run the latest container with:

`docker run stakater/java:oracle-8`

## Advanced

Build an image:
`docker build -t stakater/java:oracle-8 .`

Push an image:
`sudo docker push stakater/java:oracle-8`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`