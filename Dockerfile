FROM wehkamp/alpine:3.2

LABEL container.name="wehkamp/docker-gc:1.0"

# Force removal of images with multiple tags.
ENV FORCE_IMAGE_REMOVAL 1

RUN apk --update add bash \
  && rm -rf /var/cache/apk/*

COPY ./docker-gc /docker-gc
CMD ["/docker-gc"]
