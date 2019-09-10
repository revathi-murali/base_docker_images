SRCROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BUILD_SCRIPT_PATH=build_lang_image.sh
ALPINE_DOCKER_LABEL=aws/alpine
OS=alpine
TAG=$(tag) # Alpine version / lang version
ALPINE_VERSION=$(alpine_version) ## Passed when building language images

base.alpine.build: validate_tag base_patches
	docker build --no-cache \
    --build-arg ALPINE_VERSION=$(TAG) \
    -t $(ALPINE_DOCKER_LABEL):$(TAG)\
    -f Dockerfile .

validate_tag:
	if [ -z $(TAG) ]; then \
		echo "Please provide a valid alpine version tag=<supported alpine version> to build the image. Refer README.md for more details."; \
		exit 1; \
	fi;

base_patches:
	@echo "No patches found for alpine $(TAG) image"

ruby.alpine.build: validate_alpine_version build_image

golang.alpine.build: validate_alpine_version build_image

python.alpine.build: validate_alpine_version build_image

validate_alpine_version:
	if [ -z $(ALPINE_VERSION) ]; then \
		echo "Please provide alpine_version=<supported alpine version> to build the image. Refer README.md for more details."; \
		exit 1; \
	fi;

build_image:
	cd $(SRCROOT)/.. &&  . $(BUILD_SCRIPT_PATH) $(OS) $(ALPINE_VERSION)  "$(MAKECMDGOALS)" $(TAG)
