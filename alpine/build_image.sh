#!/bin/bash
readonly ALPINE_VERSION=3.9
readonly RUBY_VERSIONS=("2.5.5")
readonly GOLANG_VERSIONS=("1.12" "1.13")
readonly PYTHON_VERSIONS=("3.7" "3.9")

readonly BASE_ALPINE_DOCKER_LABEL="aws/alpine"
readonly RUBY_ALPINE_DOCKER_LABEL="aws/ruby" #TBD
readonly GOLANG_ALPINE_DOCKER_LABEL="aws/golang" #TBD
readonly PYTHON_ALPINE_DOCKER_LABEL="aws/python" #TBD

make_target=($(echo $1 | tr '.' "\n"))
tag="$2"
lang="${make_target}"
# Change to upper case
upcase_lang=$(echo $lang | tr 'a-z' 'A-Z')

if [ "$tag" = "" ]; then
  case "$lang" in
  "ruby") supported_versions="${RUBY_VERSIONS[@]}"
  ;;
  "golang") supported_versions="${GOLANG_VERSIONS[@]}"
  ;;
  "python") supported_versions="${PYTHON_VERSIONS[@]}"
  ;;
  esac
  echo "Please specify one of the tags ${supported_versions} for $lang"
fi

find ./"$ALPINE_VERSION"/"$lang" -name "Dockerfile-$lang$tag" -type f | egrep ".*"

if ! [ "$?" == 0 ]; then
  echo "TAG $tag is not supported for $lang alpine image, exiting..."
  exit 1
fi

docker_label="$upcase_lang"_ALPINE_DOCKER_LABEL
docker_tag="$tag-alpine$ALPINE_VERSION"
dockerfile="$ALPINE_VERSION/$lang/Dockerfile-$lang$tag"
echo "Building image with tag - ${!docker_label}:$docker_tag"

docker build --no-cache \
  --build-arg BASE_ALPINE_DOCKER_LABEL="$BASE_ALPINE_DOCKER_LABEL"\
  --build-arg BASE_ALPINE_DOCKER_TAG="$ALPINE_VERSION" \
  -t "${!docker_label}":"$docker_tag" \
  -f "$dockerfile" .