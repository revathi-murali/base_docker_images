RUBY_VERSION=2.5.5
ALPINE_VERSION=3.9
GOLANG_VERSION=1.12

define version_set
lang="$(word 1,$(subst ., ,$1))"
tag=$2
echo $(LANG)
pathfile="$(lang)/Dockerfile-$(lang)$(tag)"
echo $(pathfile)
#TODO check for existence of the dockerfile for the version passed
endef