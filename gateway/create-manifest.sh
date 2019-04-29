#!/usr/bin/env bash
# Wirepas Oy

export DOCKER_CLI_EXPERIMENTAL=enabled

DOCKER_TAG=${DOCKER_TAG:-"latest"}

# creates the manifest for x86 and ARM
docker manifest create wirepas/gateway:"${DOCKER_TAG}" \
                       wirepas/gateway-x86:"${DOCKER_TAG}" \
                       wirepas/gateway-rpi:"${DOCKER_TAG}"

# sets the correct platform for rpi
docker manifest annotate wirepas/gateway:"${DOCKER_TAG}" \
                         wirepas/gateway-rpi:"${DOCKER_TAG}" \
                         --arch arm

