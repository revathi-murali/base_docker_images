ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN \
  apk add --update \

  ca-certificates curl jq make \

  py2-pip && \

  # Install awscli for secret manager
  pip install --upgrade pip awscli