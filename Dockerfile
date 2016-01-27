FROM wehkamp/alpine:3.2

LABEL container.name="wehkamp/docker-gc:1.9.1"

ENV DOCKER_VERSION 1.9.1
# Default to having one day in between multiple runs of docker-gc.
ENV INTERVAL 14400
# Force removal of images with multiple tags.
ENV FORCE_IMAGE_REMOVAL 1

RUN apk --update add bash python \
  && wget -q -O /bin/docker https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} \
  && chmod +x /bin/docker \
  && rm -rf /var/cache/apk/*

COPY ./docker-gc /docker-gc

VOLUME /var/lib/docker-gc

CMD ["/bin/sh", "-c", "while true; do /docker-gc ; sleep ${INTERVAL}; done"]
