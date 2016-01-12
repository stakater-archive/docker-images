## swagger editor

https://github.com/swagger-api/swagger-editor

based on Ubuntu 14.04

Run the latest container with:

`docker run -d -p 8080:8080 -t stakater/swagger-editor`

## Advanced

Build an image:
`docker build -t stakater/swagger-editor .`

Push an image:
`sudo docker push stakater/swagger-editor`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

you can access the swagger-editor at:

`http://localhost:8080/swagger-editor/#/`