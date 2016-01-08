## gradle docker images

based on Ubuntu 14.04 and Oracle Java 8

Run the latest container with:

`docker run stakater/gradle`

## Advanced

Build an image:
`docker build -t stakater/gradle .`

Push an image:
`sudo docker push stakater/gradle`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`