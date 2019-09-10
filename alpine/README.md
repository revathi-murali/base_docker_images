# Alpine Base Images

This directory contains steps to create alpine base docker images that can be used across all services

## For building alpine base image:

```
make -s base.alpine.build tag=<supported alpine version>

```

## For building ruby-alpine base image

```
make -s ruby.alpine.build tag=<supported ruby version> alpine_version=<supported alpine version>
```

## For building golang-alpine base image

```
make -s golang.alpine.build tag=<supported golang version> alpine_version=<supported alpine version>
```

## For building pythong-alpine base image
```
make -s python.alpine.build tag=<supported golang version> alpine_version=<supported alpine version>
```
