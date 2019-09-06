# Alpine Base Images

This directory contains steps to create alpine base docker images that can be used across all services

## For building alpine base image:

```
make base.alpine.build tag=<supported alpine version>

```
Note: If the tag is not specified, it builds the image for alpine 3.9

## For building ruby-alpine base image

```
make ruby.alpine.build tag=<supported ruby version>
```

## For building golang-alpine base image

```
make golang.alpine.build tag=<supported golang version>
```
