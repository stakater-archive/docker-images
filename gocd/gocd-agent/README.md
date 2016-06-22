## GoCD Agent 16.5.0-3305
GoCD Agent docker file with `make` and `terraform` installed.

From GoCD:
# Usage

Start the container with this:
```
docker run -ti -e GO_SERVER=your.go.server.ip_or_host gocd/gocd-agent
```
You'll see docker download the image (might take a little while, the first time), and then the GoCD Agent will start up. You'll see messages in blue, telling you what is happening. In a few seconds, it should show up in the agents tab of your server.

This starts becoming useful when you use this container with the gocd-server container. They have been setup to auto-register to each other. So, if you have a gocd-server container running and it's named angry_feynman, you can register a gocd-agent container to it, automatically. Just do this:
```
docker run -ti --link angry_feynman:go-server gocd/gocd-agent
```
As
long as you use go-server as the link alias, the agent will automatically find the server and connect to it! Instead of the name (angry_feynman), you can use the ID of the GoCD server container or any name you provided it, using the --name option, when you started it.

If you need to start a few GoCD agents together, you can of course use the shell to do that. Start a few agents in the background, like this:
```
for each in 1 2 3; do docker run -d --link angry_feynman:go-server gocd/gocd-agent; done
```
## Getting into the container

Sometimes, you need a shell inside the container (to create test repositories, etc). docker provides an easy way to do that:
```
docker exec -i -t CONTAINER-ID bash
```
To check the agent logs, you can do this:
```
docker exec -i -t CONTAINER-ID tail -f /var/log/go-agent/go-agent.log
```
## Additional information

The agent starts using a default auto-registration key of 123456789abcdef. If you need to use a different auto-registration key, all you need to do is to set the AGENT_KEY environment variable. Like this:
```
      docker run -e AGENT_KEY=your_key_here -d --link ... gocd/gocd-agent
```
More about agent auto-registration here: www.go.cd/documentation/user/current/advanced_usage/agent_auto_register.html

    Sources of this docker container (the Dockerfile, etc) are here, on GitHub.
