## filebeat docker image

based on Ubuntu 14.04

Run the latest container with:

`docker run stakater/filebeat`

## Advanced

Build an image:
`docker build -t stakater/filebeat .`

Push an image:
`sudo docker push stakater/filebeat`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

Before starting Filebeat, you should look at the configuration options in the configuration file, for example /etc/filebeat/filebeat.yml

docker run -d -v "/Users/rasheed/Documents/projects/pliro/ams/logs:/var/log/app" -e "LOGSTASH_HOST=192.168.99.100" -e "LOGSTASH_PORT=5044" stakater/filebeat


/etc/init.d/filebeat start

./filebeat -e -d "*" -c filebeat.yml

./filebeat -e -d "*" -c /etc/filebeat/filebeat.yml

Run filebeat manually with debug level logs:
/usr/bin/filebeat -e -d "*" -c /etc/filebeat/filebeat.yml

CMD 					["/usr/bin/filebeat", "-e", "-d", "\"*\"", "-c", "/etc/filebeat/filebeat.yml"]

filebeat logs can be found at: /var/log/mybeat/mybeat

and level can be changed in filebeat.yml