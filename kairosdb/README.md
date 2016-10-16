# KairosDB Docker

Dockerfile to run KairosDB on Cassandra. Configuration is done through environment variables.

`docker run stakater/kairosdb`

`docker run -P -e "CASS_HOSTS=192.168.1.63:9160" -e "REPFACTOR=1" stakater/kairosdb`

## Advanced

Build an image:
`docker build -t stakater/kairosdb .`

Push an image:
`sudo docker push stakater/kairosdb`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

## Healthcheck

There are currently two health checks executed for each API.

- The JVM thread deadlock check verifies that no deadlocks exist in the KairosDB JVM.
- The Datastore query check performs a query on the data store to ensure that the data store is responding.

KairosDB provides REST APIs that show the health of the system.

See [HealthCheck](https://kairosdb.github.io/docs/build/html/restapi/Health.html)

### Status

        http://[host]:[port]/api/v1/health/status

        [
			"JVM-Thread-Deadlock: OK",
			"Datastore-Query: OK"
		]

### Check

Checks the status of each health check. If all are healthy it returns status 204 otherwise it returns 500. This can be configured to return something other than 204 by changing the kairosdb.health.healthyResponseCode property.

Method
		GET

Request
		http://[host]:[port]/api/v1/health/check

Response
		Success
			Returns 204 if all checks are healthy.
			
		Failure
			Returns 500 if any of the checks are unhealthy.

### [Web UI](https://kairosdb.github.io/docs/build/html/WebUI.html)

        http://[host]:[port]
