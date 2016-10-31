Grafana KairosDB Cassandra
==========================

This docker compose runs KairosDB, Cassandra & Grafana which is a perfect combo for stats monitoring!

    docker-compose -f cassandra-kairosdb-grafana.yml up

## KairosDB

### KairosDB Health Check
    http://[host]:[port]/api/v1/health/check

### KairosDB Status
    http://[host]:[port]/api/v1/health/status

### Open KairosDB [Web UI](https://kairosdb.github.io/docs/build/html/WebUI.html)
    http://[host]:[port]

## Check Grafana
    http://[host]:[port]/

_NOTE_ Look in the README's of individual components for further details.