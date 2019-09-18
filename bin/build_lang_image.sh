#!/bin/bash
# This script called within a Makefile. Please follow the usage instructions below when called directly without make commands
usage="$(basename "$0") [-h] -- builds the docker image for a language(ruby, python, golang, node) based on centos or alpine version. 
ARG1 - base distribution on which the docker image will be built. eg: 'alpine' or 'centos'
ARG2 - version for the base distribution. eg: '3.9' or '7'
ARG3 - make command called. eg: 'ruby.alpine.build' or 'python.centos.build'
ARG4 - tag for the final docker image. eg: '2.5.5'
Note: This script is called within a Makefile and hence it is required to follow the pattern for the arguments."

if [ "$1" == "-h" ]; then
  echo "Usage: $usage"
  exit 0
fi

DIR=$(dirname "${BASH_SOURCE[0]}")
readonly ALPINE_DOCKER_LABEL="coupa/alpine"
readonly CENTOS_DOCKER_LABEL="coupa/centos"
readonly RUBY_DOCKER_LABEL="coupa/ruby" #TBD
readonly GOLANG_DOCKER_LABEL="coupa/golang" #TBD
readonly PYTHON_DOCKER_LABEL="coupa/python" #TBD
readonly NODE_DOCKER_LABEL="coupa/node" #TBD

readonly CENTOS_VERSIONS=("7")
readonly ALPINE_VERSIONS=("3.9")
readonly RUBY_VERSIONS=("2.5.5")
readonly GOLANG_VERSIONS=("1.12")
readonly PYTHON_VERSIONS=("2.7.16" "3.7.4" "3.6.9")
readonly NODE_VERSIONS=("10.16.3" "12.10.0")

variant=$1
variant_version="$2"
mk_target=($(echo $3 | tr '.' "\n"))
tag="$4"
lang="${mk_target}"

# Validate variant version
case $variant in
  alpine)
    if [[ " ${ALPINE_VERSIONS[*]} " != *"$variant_version"* ]]; then
      echo "Unknown version $variant_version for alpine.Exiting.."
      exit 1;
    fi
    ;;
  centos)
    if [[ " ${CENTOS_VERSIONS[*]} " != *"$variant_version"* ]]; then
      echo "Unknown version $variant_version for centos.Exiting.."
      exit 1;
    fi
    ;;
  *)
    echo 'Unknown base variant distribution. Exiting..'
    exit 1
    ;;
esac

# Change lang and variant to upper case
upcase_lang=$(echo $lang | tr 'a-z' 'A-Z')
upcase_variant=$(echo $variant | tr 'a-z' 'A-Z')

if [ "$tag" = "" ]; then
  case "$lang" in
  "ruby") supported_versions="${RUBY_VERSIONS[@]}"
  ;;
  "golang") supported_versions="${GOLANG_VERSIONS[@]}"
  ;;
  "python") supported_versions="${PYTHON_VERSIONS[@]}"
  ;;
  "node") supported_versions="${NODE_VERSIONS[@]}"
  ;;
  *) echo 'Unknown language.Exiting..'; exit 1;
  ;;
  esac
  echo "Please specify one of the $lang versions (${supported_versions}) as tag to build $variant$variant_version based $lang image. Refer README.md under $variant directory."
  exit 1
fi

# Check if the Dockerfile for the required variant and lang is present
find "$DIR/../$variant/$variant_version/$lang" -name "Dockerfile-$lang$tag" -type f | egrep ".*"

if ! [ "$?" == 0 ]; then
  echo "TAG $tag is not supported for $lang $variant-$variant_version image.Exiting..."
  exit 1
fi

docker_variant_label="$upcase_variant"_DOCKER_LABEL
docker_lang_tag="$tag-$variant$variant_version"
docker_lang_label="$upcase_lang"_DOCKER_LABEL
dockerfile="$DIR/../$variant/$variant_version/$lang/Dockerfile-$lang$tag"
echo "Building image with tag - ${!docker_lang_label}:$docker_lang_tag"

docker build \
  --build-arg "$upcase_variant"_DOCKER_LABEL="${!docker_variant_label}"\
  --build-arg "$upcase_variant"_DOCKER_TAG="$variant_version" \
  -t "${!docker_lang_label}":"$docker_lang_tag" \
  -f "$dockerfile" .
