#!/bin/bash
set -e
docker build -t ${IMAGE_NAME} -f docker/Dockerfile .