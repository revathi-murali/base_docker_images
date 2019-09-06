# Alpine Base Images

This directory contains steps to create alpine base docker images that can be used across all services

## For building alpine base image:

```
make base.alpine.build tag=<supported alpine version>

```

## For building ruby-alpine3.9 base image

```
cd 3.9 && make ruby.alpine.build tag=<supported ruby version>
```

## For building golang-alpine3.9 base image

```
cd 3.9 && make golang.alpine.build tag=<supported golang version> 
```

