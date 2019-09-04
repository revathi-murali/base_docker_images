SRCROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

ALPINE_VERSION = 3.9

BASE_ALPINE_DOCKER_LABEL = aws/alpine#TBD: Replace with AWS ECR repo may be?
BASE_ALPINE_DOCKER_TAG = $(ALPINE_VERSION)

RUBY_ALPINE_DOCKER_LABEL = aws/ruby#TBD
RUBY_ALPINE_DOCKER_TAG = 2.5.5-alpine$(ALPINE_VERSION)

GOLANG_ALPINE_DOCKER_LABEL = aws/golang#TBD
GOLANG_ALPINE_DOCKER_TAG = 1.12.9-alpine$(ALPINE_VERSION)

PYTHON_ALPINE_DOCKER_LABEL = aws/python#TBD
PYTHON_ALPINE_DOCKER_TAG = 3.7-alpine$(ALPINE_VERSION)

base.alpine.build: base_patches
  docker build --no-cache \
    --build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
    -t $(BASE_ALPINE_DOCKER_LABEL):$(BASE_ALPINE_DOCKER_TAG)\
    -f Dockerfiles/Dockerfile .

ruby.alpine.build: dockerfile ruby_patches
  cd ruby &&
  docker build --no-cache \
    --build-arg BASE_ALPINE_DOCKER_LABEL=$(BASE_ALPINE_DOCKER_LABEL)\
    --build-arg BASE_ALPINE_DOCKER_TAG=$(BASE_ALPINE_DOCKER_TAG) \
    -t $(RUBY_ALPINE_DOCKER_LABEL):$(RUBY_ALPINE_DOCKER_TAG) \
    -f Dockerfile-ruby2.5.5 .

golang.alpine.build: go_patches
  cd golang &&
  docker build --no-cache \
    --build-arg BASE_ALPINE_DOCKER_LABEL=$(BASE_ALPINE_DOCKER_LABEL)\
    --build-arg BASE_ALPINE_DOCKER_TAG=$(BASE_ALPINE_DOCKER_TAG) \
    -t $(GOLANG_ALPINE_DOCKER_LABEL):$(GOLANG_ALPINE_DOCKER_TAG) \
    -f Dockerfile-golang1.12 .

python.alpine.build: python_patches
  cd python
  docker build --no-cache \
    --build-arg BASE_ALPINE_DOCKER_LABEL=$(BASE_ALPINE_DOCKER_LABEL)\
    --build-arg BASE_ALPINE_DOCKER_TAG=$(BASE_ALPINE_DOCKER_TAG) \
    -t $(PYTHON_ALPINE_DOCKER_LABEL):$(PYTHON_ALPINE_DOCKER_TAG) \
    -f Dockerfile-python3.7 .

dockerfile:
  ifeq "$(SOME_VARIABLE)" "yes"
  exit 0
  fi

# base_patches:
#   echo 'No patches found for alpine base image'

# ruby_patches:
#   echo 'No ruby patches found for alpine image'

# go_patches:
#   echo 'No golang patches found for alpine image'

# python_patches:
#   echo 'No python patches found for alpine image'
