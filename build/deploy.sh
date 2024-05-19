#!/bin/bash

# Determine the repo to pull the image from
if [ "$DOCKER_REPO" == "dev" ]; then
    REPO=$DOCKER_DEV_REPO
elif [ "$DOCKER_REPO" == "prod" ]; then 
    REPO=$DOCKER_PROD_REPO
fi

# Pull the image from the respective repository
docker pull $REPO:latest

# Run the container
docker run -d -p 80:80 $REPO:latest