#!/bin/bash

# Define variables for your container
CONTAINER_NAME="portainer"
IMAGE_NAME="portainer/portainer-ee:latest"
PORTAINER_VOLUME="portainer_data"
PORTAINER_PORT="9443"

# Stop and remove the existing container
docker stop "$CONTAINER_NAME"
docker rm "$CONTAINER_NAME"

# Pull the latest image
docker pull "$IMAGE_NAME"

# Create and run a new container
docker run -d -p "$PORTAINER_PORT:9443" \
  --name "$CONTAINER_NAME" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$PORTAINER_VOLUME:/data" \
  "$IMAGE_NAME"
