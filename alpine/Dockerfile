ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

# Install basic packages
RUN apk add --update \
    ca-certificates curl jq make which

# Necessary packages for installing pip
RUN apk add --update python3 python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools

# Install awscli for accessing secretsmanager
RUN pip3 install awscli
