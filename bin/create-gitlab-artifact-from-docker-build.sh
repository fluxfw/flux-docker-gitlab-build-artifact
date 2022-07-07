#!/usr/bin/env sh

set -e

image="$1"
if [ -z "$image" ]; then
    echo "Please pass an image"
    exit 1
fi

path_in_image="$2"
if [ -z "$path_in_image" ]; then
    echo "Please pass a path in image"
    exit 1
fi
path_in_image_name="`basename "$path_in_image"`"

archive_name="$3"
if [ -z "$archive_name" ]; then
    echo "Please pass an archive name"
    exit 1
fi

echo "Create $archive_name from $path_in_image in $image"
docker run --rm --network none "$(echo -e "FROM alpine:latest\nCOPY --from=\"$image\" \"$path_in_image\" \"/build/$path_in_image_name\"\nRUN (cd /build && if [ -d \"$path_in_image_name\" ]; then tar -czf build.tar.gz \"$path_in_image_name\"; else mv \"$path_in_image_name\" build.tar.gz; fi)" | docker build - --pull | awk '/Successfully built/{print $NF}')" cat /build/build.tar.gz > "$CI_PROJECT_DIR/$archive_name"
