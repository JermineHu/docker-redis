FROM alpine:edge as redis
MAINTAINER Jermine.hu@qq.com
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk update && apk add --no-cache upx binutils redis && \
    cd /usr/bin && upx --best redis-server
FROM alpine:edge as redis2
MAINTAINER Jermine.hu@qq.com
# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN addgroup -S redis && adduser -S -G redis redis ;\
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk update && apk add --no-cache \
# grab su-exec for easy step-down from root
		'su-exec>=0.2' \
# add tzdata for https://github.com/docker-library/redis/issues/138
		redis && rm /usr/bin/redis-cli  /usr/bin/redis-benchmark && \
        mkdir /data && chown redis:redis /data
VOLUME /data
WORKDIR /data
COPY --from=redis:5.0.5-alpine /usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY --from=redis /usr/bin/redis-server /usr/bin/redis-server
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 6379
CMD ["redis-server"]
FROM jermine/bbox
RUN mkdir -p /home/redis && touch /etc/group && touch /etc/passwd && addgroup -S redis && adduser -S -G redis redis && \
    mkdir /data && chown redis:redis /data
VOLUME /data
WORKDIR /data
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY --from=redis /usr/bin/redis-server /usr/bin/redis-server
COPY --from=redis2 /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 6379
CMD ["redis-server"]