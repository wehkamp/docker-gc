FROM wehkamp/alpine:3.2

# Force removal of images with multiple tags.
ENV FORCE_IMAGE_REMOVAL 1

COPY ./docker-gc /docker-gc
VOLUME /var/lib/docker-gc
CMD ["/docker-gc"]

ENV DOCKER_VERSION 1.11.2
RUN LAYER=build \
  && apk --update add bash \
  && wget -q -O - https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz | tar -xzC /tmp/ \
  && mv /tmp/docker/docker /bin/ \
  && chmod +x /bin/docker \
  && rm -rf /var/cache/apk/* /tmp/*

LABEL container.name="wehkamp/docker-gc:1.11.2"
