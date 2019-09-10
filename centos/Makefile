SRCROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BUILD_SCRIPT_PATH=build_lang_image.sh
CENTOS_DOCKER_LABEL=aws/centos
OS=centos
TAG=$(tag) # Centos version / lang version
CENTOS_VERSION=$(centos_version) ## Passed when building language images

base.centos.build: validate_tag base_patches
	docker build --no-cache \
    --build-arg CENTOS_VERSION=$(TAG) \
    -t $(CENTOS_DOCKER_LABEL):$(TAG)\
    -f Dockerfile .

validate_tag:
	if [ -z $(TAG) ]; then \
		echo "Please provide a valid centos version tag=<centos version> to build the image. Refer README.md for more details."; \
		exit 1; \
	fi;

base_patches:
	@echo "No patches found for centos $(TAG) image"

ruby.centos.build: validate_centos_version build_image

validate_centos_version:
	if [ -z $(CENTOS_VERSION) ]; then \
		echo "Please provide centos_version=<supported centos version> to build the image. Refer README.md for more details."; \
		exit 1; \
	fi;

build_image:
	cd $(SRCROOT)/.. &&  . $(BUILD_SCRIPT_PATH) $(OS) $(CENTOS_VERSION)  "$(MAKECMDGOALS)" $(TAG)
