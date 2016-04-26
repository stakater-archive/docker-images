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

Tell filebeat container three things:
1. location (directory) containing logs to beat
2. logstash server host
3. logstash server port

e.g.

`docker run -d -v "/Users/rasheed/Documents/projects/pliro/ams/logs:/var/log/app" -e "LOGSTASH_HOST=192.168.99.100" -e "LOGSTASH_PORT=5044" stakater/filebeat`


/etc/init.d/filebeat start

./filebeat -e -d "*" -c filebeat.yml

run filebeat with full debug logs...

./filebeat -e -d "*" -c /etc/filebeat/filebeat.yml

Run filebeat manually with debug level logs:
/usr/bin/filebeat -e -d "*" -c /etc/filebeat/filebeat.yml

CMD 					["/usr/bin/filebeat", "-e", "-d", "\"*\"", "-c", "/etc/filebeat/filebeat.yml"]

filebeat logs can be found at: /var/log/mybeat/mybeat

and level can be changed in filebeat.yml


filebeat & elasticsearch

Before starting Filebeat for the first time, run this command (replace ELASTIC_SEARCH_HOST with the appropriate hostname) to load the default index template in Elasticsearch:

    curl -XPUT 'http://{ELASTIC_SEARCH_HOST}:9200/_template/filebeat?pretty' -d@/{PATH_TO_THIS_FILE}/filebeat.template.json

And the response should be:

{
  "acknowledged" : true
}

Things to do:

1. push the filebeat container to dockehub