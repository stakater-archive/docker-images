## Base Docker Image

Run the latest container with:

`docker run stakater/java:oracle-6`

## Advanced

Build an image:
`docker build -t stakater/java:oracle-6 .`

Push an image:
`sudo docker push stakater/java:oracle-6`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`