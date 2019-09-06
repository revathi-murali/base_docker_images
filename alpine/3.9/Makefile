SRCROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BUILD_SCRIPT_PATH=$(SRCROOT)/build_image.sh

TAG=$(tag)

ruby.alpine.build: ruby_patches build_image

golang.alpine.build: go_patches build_image

python.alpine.build: python_patches build_image

build_image:
	. $(BUILD_SCRIPT_PATH) "$(MAKECMDGOALS)" $(TAG)

ruby_patches:
	@echo 'No ruby patches found for alpine 3.9 image'

go_patches:
	@echo 'No golang patches found for alpine 3.9 image'

python_patches:
	@echo 'No python patches found for alpine 3.9 image'