FROM alpine:latest
MAINTAINER Tobias Maier <tobias.maier@baucloud.com>

RUN apk add --no-cache \
  groff \
  less \
  python

RUN \
  apk add --no-cache --virtual build-dependencies \
    py-pip \
  && pip install awscli \
  && apk del build-dependencies

COPY bin/* /usr/local/bin/

CMD sh
