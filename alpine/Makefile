ALPINE_VERSION = 3.9

BASE_ALPINE_DOCKER_LABEL = aws/alpine#TBD
BASE_ALPINE_DOCKER_TAG = $(ALPINE_VERSION)

RUBY_ALPINE_DOCKER_LABEL = aws/ruby#TBD
RUBY_ALPINE_DOCKER_TAG = 2.5.5-alpine$(ALPINE_VERSION)

GOLANG_ALPINE_DOCKER_LABEL = aws/golang#TBD
GOLANG_ALPINE_DOCKER_TAG = 1.12.9-alpine$(ALPINE_VERSION)

base.alpine.build: base_patches
  docker build --no-cache \
    --build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
    -t $(BASE_ALPINE_DOCKER_LABEL):$(BASE_ALPINE_DOCKER_TAG)\
    -f Dockerfiles/Dockerfile .

ruby.alpine.build: ruby_patches
  docker build --no-cache \
    --build-arg BASE_ALPINE_DOCKER_LABEL=$(BASE_ALPINE_DOCKER_LABEL)\
    --build-arg BASE_ALPINE_DOCKER_TAG=$(BASE_ALPINE_DOCKER_TAG) \
    -t $(RUBY_ALPINE_DOCKER_LABEL):$(RUBY_ALPINE_DOCKER_TAG) \
    -f Dockerfiles/Dockerfile-ruby2.5.5 .

golang.alpine.build: go_patches
  docker build --no-cache \
    --build-arg BASE_ALPINE_DOCKER_LABEL=$(BASE_ALPINE_DOCKER_LABEL)\
    --build-arg BASE_ALPINE_DOCKER_TAG=$(BASE_ALPINE_DOCKER_TAG) \
    -t $(GOLANG_ALPINE_DOCKER_LABEL):$(GOLANG_ALPINE_DOCKER_TAG) \
    -f Dockerfiles/Dockerfile-golang1.12 .

base_patches:
  echo 'No patches found for alpine base image'

ruby_patches:
  echo 'No ruby patches found for alpine base image'

go_patches:
  echo 'No golang patches found for alpine base image'
