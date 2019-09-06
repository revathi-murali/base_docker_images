ALPINE_VERSION=$(tag)
BASE_ALPINE_DOCKER_LABEL= aws/alpine#TBD: Replace with AWS ECR repo may be?

base.alpine.build: base_patches
	docker build --no-cache \
    --build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
    -t $(BASE_ALPINE_DOCKER_LABEL):$(ALPINE_VERSION)\
    -f Dockerfile .

base_patches:
	@echo "No patches found for alpine $(ALPINE_VERSION) image"
