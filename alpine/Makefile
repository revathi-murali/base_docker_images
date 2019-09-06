SRCROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
TAG=$(tag)
BUILD_SCRIPT_PATH=$(SRCROOT)/build_image.sh

ALPINE_VERSION=$(if $(tag),$(tag),3.9)
BASE_ALPINE_DOCKER_LABEL= aws/alpine#TBD: Replace with AWS ECR repo may be?

base.alpine.build: base_patches
	docker build --no-cache \
    --build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
    -t $(BASE_ALPINE_DOCKER_LABEL):$(ALPINE_VERSION)\
    -f Dockerfile .

ruby.alpine.build: ruby_patches build_image

golang.alpine.build: go_patches build_image

python.alpine.build: python_patches build_image

build_image:
	. $(BUILD_SCRIPT_PATH) "$(MAKECMDGOALS)" $(TAG)

base_patches: 
	@echo 'No patches found for alpine base image'

ruby_patches:
	@echo 'No ruby patches found for alpine base image'

go_patches:
	@echo 'No golang patches found for alpine base image'

python_patches:
	@echo 'No python patches found for alpine base image'
