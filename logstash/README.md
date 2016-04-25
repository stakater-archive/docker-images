## logstash docker image

based on Ubuntu 14.04 & oracle java 8

Run the latest container with:

`docker run stakater/logstash`

## Advanced

Build an image:
`docker build -t stakater/logstash .`

Push an image:
`sudo docker push stakater/logstash`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

Start Logstash with configuration file

If you need to run logstash with a configuration file, logstash.conf, that's located in your current directory, you can use the logstash image as follows:

run logstash which will take input from stdin & send output to stdout
`docker run -it --rm stakater/logstash logstash -e 'input { stdin { } } output { stdout { } }'`

Tell logstash container three things:
1. ports to expose
2. logstash conf
3. 
`docker run -it --rm -v "$PWD":/config-dir -p 5044:5044 stakater/logstash logstash -f /config-dir/logstash.conf`

it should print:

```
Settings: Default pipeline workers: 1
Pipeline main started
```

`$ docker run -it --rm -v "$PWD":/config-dir logstash logstash -f /config-dir/logstash.conf`

logstash configurations can be found on this location:

/etc/logstash/conf.d

one beats input: beats-input.conf 


one elasticsearch output: 30-output.conf

Logstash has a rich collection of input, filter, codec and output plugins.

Input Plugins - https://www.elastic.co/guide/en/logstash/current/input-plugins.html
An input plugin enables a specific source of events to be read by Logstash.


Filter Plugins - https://www.elastic.co/guide/en/logstash/current/filter-plugins.html
A filter plugin performs intermediary processing on an event. Filters are often applied conditionally depending on the characteristics of the event.


Output Plugins - https://www.elastic.co/guide/en/logstash/current/output-plugins.html
An output plugin sends event data to a particular destination. Outputs are the final stage in the event pipeline.


Codec Plugins - https://www.elastic.co/guide/en/logstash/current/codec-plugins.html
A codec plugin changes the data representation of an event. Codecs are essentially stream filters that can operate as part of an input or output.

Inspiration from: https://hub.docker.com/_/logstash/

		manage_template => false
		index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
		document_type => "%{[@metadata][type]}"
