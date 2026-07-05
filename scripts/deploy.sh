#!/bin/bash
set -e
echo "Pulling latest image..."
docker pull $IMAGE_NAME # Pull the latest image from the registry
echo "Stopping existing container..."
docker compose down || true # Ignore errors if the container is not running
echo "Starting application..."
docker compose up -d # Start the application in detached mode