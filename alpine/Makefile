ALPINE_VERSION=$(tag)
BASE_ALPINE_DOCKER_LABEL= aws/alpine#TBD: Replace with AWS ECR repo may be?

base.alpine.build: validate_tag base_patches
	docker build --no-cache \
    --build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
    -t $(BASE_ALPINE_DOCKER_LABEL):$(ALPINE_VERSION)\
    -f Dockerfile .
validate_tag:
	if [ -z $(ALPINE_VERSION) ]; then \
		echo "Please provide a valid alpine version as the tag to build the image. Refer README.md for more details."; \
		exit 1; \
	fi;
base_patches:
	@echo "No patches found for alpine $(ALPINE_VERSION) image"
