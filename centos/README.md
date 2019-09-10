# Centos Base Images

This directory contains steps to create centos base docker images that can be used across all services

## For building centos base image:

```
make -s base.centos.build tag=<supported centos version>

```

## For building ruby-centos base image

```
make -s ruby.centos.build tag=<supported ruby version> centos_version=<supported centos version>
```
