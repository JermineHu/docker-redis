# For build  Minimized redis docker images

The docker hub repo [here](https://hub.docker.com/r/jermine/redis).


The source code repo [here](https://github.com/JermineHu/docker-redis).

## Start a redis server
```
docker run -d --name redis --restart=always -p 6379:6379  jermine/redis
```

## To check docker image
```
[jermine@jermine-pc redis]$ docker images | grep redis
jermine/redis           alpine              d7c5da04b374        8 minutes ago       8.54MB
jermine/redis           latest              11ba911b4b99        33 minutes ago      1.62MB
redis                   5.0.5-alpine        72e76053ebb7        3 weeks ago         50.9MB
redis                   alpine              72e76053ebb7        3 weeks ago         50.9MB
[jermine@jermine-pc redis]$ 

```

