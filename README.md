# docker-pi-dashboard
[pi dashboard](https://github.com/spoonysonny/pi-dashboard) for docker

## build
> It's optional
```
docker build -t ecat/docker-pi-dashboard .
```

## run
It's very simple!
```
docker run -d --name docker-pi-dashboard -e 'LISTEN=1024' --net=host ecat/docker-pi-dashboard
```

- The environment variable **LISTEN** is optional which default is **80**.
- The `--net=host` is necessary to make pi-dashboard get the correct net information of host.
	- **Attention:**Some version may be `--network='host'`.

After all the above steps are completed, you can access `http://pihost:port` with a browser.