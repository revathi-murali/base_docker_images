#!/bin/bash
DIR=$(dirname "${BASH_SOURCE[0]}")
readonly ALPINE_DOCKER_LABEL="aws/alpine"
readonly CENTOS_DOCKER_LABEL="aws/centos"
readonly RUBY_DOCKER_LABEL="aws/ruby" #TBD
readonly GOLANG_DOCKER_LABEL="aws/golang" #TBD
readonly PYTHON_DOCKER_LABEL="aws/python" #TBD

readonly RUBY_VERSIONS=("2.5.5")
readonly GOLANG_VERSIONS=("1.12")
readonly PYTHON_VERSIONS=("2.7" "3.7")

readonly ALPINE_VERSION="$2"
readonly CENTOS_VERSION="$2"

os="$1"
os_version="$2"
target_called=($(echo $3 | tr '.' "\n"))
tag="$4"
lang="${target_called}"
# Change to upper case
upcase_lang=$(echo $lang | tr 'a-z' 'A-Z')
upcase_os=$(echo $os | tr 'a-z' 'A-Z')

if [ "$tag" = "" ]; then
  case "$lang" in
  "ruby") supported_versions="${RUBY_VERSIONS[@]}"
  ;;
  "golang") supported_versions="${GOLANG_VERSIONS[@]}"
  ;;
  "python") supported_versions="${PYTHON_VERSIONS[@]}"
  ;;
  esac
  echo "Please specify one of the $lang versions (${supported_versions}) as tag to build $os$os_version based $lang image. Refer README.md under $os directory."
  exit 1
fi

find "$DIR/$os/$os_version/$lang" -name "Dockerfile-$lang$tag" -type f | egrep ".*"

if ! [ "$?" == 0 ]; then
  echo "TAG $tag is not supported for $lang $os-$os_version image, exiting..."
  exit 1
fi

docker_os_tag="$upcase_os"_VERSION
docker_os_label="$upcase_os"_DOCKER_LABEL
docker_lang_tag="$tag-$os${!docker_os_tag}"
docker_lang_label="$upcase_lang"_DOCKER_LABEL
dockerfile="$DIR/$os/$os_version/$lang/Dockerfile-$lang$tag"
echo "Building image with tag - ${!docker_lang_label}:$docker_lang_tag"

docker build --no-cache \
  --build-arg "$upcase_os"_DOCKER_LABEL="${!docker_os_label}"\
  --build-arg "$upcase_os"_DOCKER_TAG="${!docker_os_tag}" \
  -t "${!docker_lang_label}":"$docker_lang_tag" \
  -f "$dockerfile" .
