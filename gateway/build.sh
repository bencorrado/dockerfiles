#!/usr/bin/env bash
# Wirepas Oy

GIT_REPO=${GIT_REPO:-"https://github.com/wirepas/gateway.git"}
GIT_TAG=${GIT_TAG:-"master"}
GIT_BRANCH=${GIT_BRANCH:-"${GIT_TAG}"}
DOCKER_TAG=${DOCKER_TAG:-"latest"}

if [[ ${GIT_TAG} == "master" ]]
then
    DOCKER_TAG="latest"
else
    DOCKER_TAG="${GIT_TAG}"
fi

function build_arch
{
    ARCH="${1}"
    echo "building ${GIT_REPO}#${GIT_BRANCH}:container/${ARCH}"
    docker build --compress \
             -t wirepas/gateway-"${ARCH}":"${DOCKER_TAG}" \
             "${GIT_REPO}"#"${GIT_BRANCH}":container/"${ARCH}"
}

build_arch "x86"
build_arch "rpi"
