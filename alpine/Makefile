DOCKER_LABEL = 'aws/dockerhub'
ALPINE_BASE_DOCKER_TAG = $(if $(tag),$(tag), '3.9')
ALPINE_RUBY_DOCKER_TAG = $(if $(tag),$(tag), '2.5.5-3.9')

ALPINE_VERSION = 3.9

alpine.base.build: base_patches
	docker build --no-cache \
		--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
		-t $(DOCKER_LABEL):$(ALPINE_BASE_DOCKER_TAG)\
		-f Dockerfiles/Dockerfile .

alpine.ruby.build: ruby_patches
	docker build --no-cache \
		-t $(DOCKER_LABEL):$(ALPINR_RUBY_DOCKER_TAG) \
		-f Dockerfiles/Dockerfile-ruby .

base_patches:
	echo 'No patches found'

ruby_patches:
	echo 'No patches found'

		