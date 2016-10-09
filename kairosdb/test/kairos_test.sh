#!/bin/bash

curl -X POST -d @kairos_write.txt http://<kairos-ip>:8080/api/v1/datapoints --header "Content-Type:application/json"
curl -X POST -d @kairos_query.txt http://<kairos-ip>:8080/api/v1/datapoints/query --header "Content-Type:application/json"