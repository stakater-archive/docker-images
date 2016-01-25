Step 1 - Create a docker container: 

e.g.

`sudo docker run --name jhipster -d -v /home/rasheed/Projects/pliro-api-jhipster:/home/jhipster -p 8080:8080 -p 9000:9000 -p 35729:35729 -p 4022:22 -t stakater/jhipster`

NOTE: please change the path to project in your directory structure! i.e. `/home/rasheed/Projects/jhipster/ams`

Step 2 - Get into docker container: 

`ssh -p 4022 jhipster@localhost`
pwd: `jhipster`

if you find the error, "host key verification failed" then run the following command and ssh again.<br/>
ssh-keygen -f "/home/ubuntu/.ssh/known_hosts" -R [localhost]:4022<br/><br/>
Step 3 - Build the app

this will ignore the tests and build a package:
`gradle build -x test`

this will run the app:
`gradle run -x test`

Helpul Command!

one liner to remove all exited containers:

`sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm`
