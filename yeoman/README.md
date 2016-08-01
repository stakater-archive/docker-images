Based on Ubuntu 16.04 LTS Xenial

Run the latest container with:

`docker run stakater/yeoman`

`docker run --name yeoman -d -v $PWD:/home/stakater -t stakater/yeoman`

Build an image:
`docker build -t stakater/yeoman .`

Push an image:
`sudo docker push stakater/yeoman`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

Its important to read this documentation: https://github.com/phusion/baseimage-docker

`docker exec -it <CONTAINER-NAME> bash`

to verify the version:

`node --version && npm --version && yo --version`

once you are inside the container then switch user to `stakater` as otherwise you might get strange permission errors like following:

```
root@576a9fe8054c:/home/stakater# yo -h            
/usr/lib/node_modules/yo/node_modules/configstore/index.js:53
				throw err;
				^

Error: EACCES: permission denied, open '/root/.config/configstore/insight-yo.json'
You don't have access to this file.

    at Error (native)
    at Object.fs.openSync (fs.js:549:18)
    at Object.fs.readFileSync (fs.js:397:15)
    at Object.create.all.get (/usr/lib/node_modules/yo/node_modules/configstore/index.js:34:26)
    at Object.Configstore (/usr/lib/node_modules/yo/node_modules/configstore/index.js:27:44)
    at new Insight (/usr/lib/node_modules/yo/node_modules/insight/lib/index.js:37:34)
    at Object.<anonymous> (/usr/lib/node_modules/yo/lib/cli.js:172:11)
    at Module._compile (module.js:409:26)
    at Object.Module._extensions..js (module.js:416:10)
    at Module.load (module.js:343:32)
```

to switch user run

`su - stakater`

