# For build  Minimized redis docker images

The docker hub repo [here](https://hub.docker.com/r/jermine/redis).


The source code repo [here](https://github.com/JermineHu/docker-redis).

## Start a redis server
```
docker run -d --name redis --restart=always -p 6379:6379  jermine/redis
```

## To check docker image
```
jermine-pc% docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
jermine/redis           alpine              7e52a0fe7989        39 minutes ago      8.53MB
jermine/redis           bbox                d6315981d630        45 minutes ago      2.09MB
jermine/redis           latest              d6315981d630        45 minutes ago      2.09MB
```

