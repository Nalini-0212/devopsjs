#!/bin/bash
set -e
PROD_REPO_NAME="naliniselv/react-app-prod:latest"
CONTAINER_NAME="react-app-container"
echo "Deploying $PROD_REPO_NAME to $CONTAINER_NAME"
cd "$(dirname "$0")/../docker" # change to the docker directory one level up from the script's location
docker pull $PROD_REPO_NAME # pull the latest image from the repository
docker stop $CONTAINER_NAME || true # stop the existing container if it exists
docker rm $CONTAINER_NAME || true # remove the existing container if it exists
docker run -d --name $CONTAINER_NAME -p 80:80 $PROD_REPO_NAME # run the new container with the pulled image