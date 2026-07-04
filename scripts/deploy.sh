#!/bin/bash
set -e
PROD_REPO_NAME="naliniselv/react-app-prod:latest"
DEV_REPO_NAME="naliniselv/react-app-dev:latest"
if [ "$BRANCH_NAME" == "dev" ]; then
    IMAGE_NAME=$DEV_REPO_NAME
else
    IMAGE_NAME=$PROD_REPO_NAME
fi
CONTAINER_NAME="react-app-container"
echo "Deploying $IMAGE_NAME to $CONTAINER_NAME"
cd docker
docker pull $IMAGE_NAME # pull the latest image from the repository
docker stop $CONTAINER_NAME || true # stop the existing container if it exists
docker rm $CONTAINER_NAME || true # remove the existing container if it exists
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME # run the new container with the pulled image