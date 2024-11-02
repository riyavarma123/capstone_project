#!/bin/bash

# Define image name and tag
IMAGE_NAME="ramya634/demo-website"
IMAGE_TAG="latest"

# Build Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# Check if the image was built successfully
if [[ $? -eq 0 ]]; then
    echo "Docker image built successfully: $IMAGE_NAME:$IMAGE_TAG"
else
    echo "Docker image build failed."
    exit 1
fi

