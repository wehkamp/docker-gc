FROM wehkamp/alpine:3.2

LABEL container.name="wehkamp/docker-gc:1.9.1"

ENV DOCKER_VERSION 1.9.1

RUN apk --update add bash python \
  && wget -q -O /bin/docker https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} \
  && chmod +x /bin/docker \
  && rm -rf /var/cache/apk/*

COPY ./docker-gc /docker-gc

VOLUME /var/lib/docker-gc

CMD ["/docker-gc"]
