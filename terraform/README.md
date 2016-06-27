# Phusion Docker Image with `terraform` & `make` installed 

This is a phusion based docker image which has `terraform 0.6.12`, `make` `awscli` and `s3cmd` installed.
It's purpose is to run any project that is based on terraform.

## Usage
### Creating a Container:

```
docker run -d --name stakater_terraform -v /etc/myTerraformCode:/usr/src/app
```
Map the directory which contains your terraform code to `/usr/src/app`.


### Running Your Code:
To run your code, pass commands to the docker container using `exec`

```
docker exec stakater_terraform /bin/bash -c "<command here>" 
```

e.g. 
```
docker exec stakater_terraform /bin/bash -c "terraform apply" 
```

OR

```
docker exec stakater_terraform /bin/bash -c "make myApp" 
```
