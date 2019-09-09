CENTOS_VERSION=$(tag)
BASE_CENTOS_DOCKER_LABEL= aws/centos#TBD: Replace with AWS ECR repo may be?

base.centos.build: validate_tag base_patches
	docker build --no-cache \
    --build-arg CENTOS_VERSION=$(CENTOS_VERSION) \
    -t $(BASE_CENTOS_DOCKER_LABEL):$(CENTOS_VERSION)\
    -f Dockerfile .
validate_tag:
	if [ -z $(CENTOS_VERSION) ]; then \
		echo "Please provide a valid centos version as the tag to build the image. Refer README.md for more details."; \
		exit 1; \
	fi;
base_patches:
	@echo "No patches found for centos $(CENTOS_VERSION) image"
