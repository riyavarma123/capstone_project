#!/bin/bash

# Define Docker image name and tag
IMAGE_NAME="ramya634/demo-website"
IMAGE_TAG="latest"
CONTAINER_NAME="demo-website-container"

# Pull the latest image from DockerHub (optional step if image is already available locally)
docker pull $IMAGE_NAME:$IMAGE_TAG

# Stop and remove existing container if it's running
if [[ $(docker ps -q -f name=$CONTAINER_NAME) ]]; then
    echo "Stopping existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Run a new container from the image
echo "Deploying the Docker container..."
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME:$IMAGE_TAG

# Check if the container is running
if [[ $(docker ps -q -f name=$CONTAINER_NAME) ]]; then
    echo "Deployment successful! Application is running on port 80."
else
    echo "Deployment failed."
    exit 1
fi

