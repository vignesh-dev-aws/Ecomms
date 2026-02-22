#!/bin/bash

IMAGE_NAME=$1
TAG=$2

echo "Stopping old container..."
docker stop app-container || true
docker rm app-container || true

echo "Running new container..."
docker run -d --name app-container -p 80:80 ${IMAGE_NAME}:${TAG}

echo "Deployment completed."
