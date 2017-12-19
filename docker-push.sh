#!/usr/bin/env bash
set -e

docker login -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWORD}"

echo $(docker run cargomedia/gearman --version)

V1=$(docker run cargomedia/gearman --version)
echo ${V1}

V2=$(docker run cargomedia/gearman --version | perl -pe 's/.*gearmand ([\d\.]+).*/$1/')
echo ${V2}

VERSION=$(docker run cargomedia/gearman --version | perl -pe 's/.*gearmand ([\d\.]+).*/$1/')
echo ${VERSION}
echo foo:${VERSION}

docker tag cargomedia/gearman:latest cargomedia/gearman:${VERSION}
docker push cargomedia/gearman:latest
docker push cargomedia/gearman:${VERSION}
