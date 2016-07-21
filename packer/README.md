# Phusion Docker Image with `packer` & `make` installed 

This is a phusion based docker image which has `packer 0.10.1`, `make` installed

It's purpose is to run any packer based project that is placed in the container. You can enter any command required to build your project other than the `packer` commands as well

## Usage
### Creating a Container:

```
docker run -d --name stakater_packer -v /etc/myPackerCode:/usr/src/app
```
Map the directory which contains your packer code to `/usr/src/app`.


### Running Your Code:
To run your code, pass commands to the docker container using `exec`

```
docker exec stakater_packer /bin/bash -c "<command here>" 
```

e.g. 
```
docker exec stakater_packer /bin/bash -c "packer --version" 
```

```
