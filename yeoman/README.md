
Run the latest container with:

`docker run stakater/yeoman`

Build an image:
`docker build -t stakater/yeoman .`

Push an image:
`sudo docker push stakater/yeoman`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

Its important to read this documentation: https://github.com/phusion/baseimage-docker

`docker exec -it <CONTAINER-NAME> bash`

to verify the version:

node --version && npm --version && yo --version