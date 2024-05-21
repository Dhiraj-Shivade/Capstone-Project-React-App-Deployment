#!/bin/bash

# Determine the repo to pull the image from
if [ "$DOCKER_REPO" == "dev" ]; then
    REPO=$DOCKER_DEV_REPO
elif [ "$DOCKER_REPO" == "prod" ]; then 
    REPO=$DOCKER_PROD_REPO
fi

# Pull the image from the respective repository
docker pull $REPO:v1

# Check if the image pull was successful.
if [ $? -ne 0 ]; then
    echo "Failed to pull the Docker image from $REPO"
    exit 1
fi

# Run the container
docker run -d -p 80:80 --name react_app_container $REPO:v1 sleep 3600


# Check if the container run was successful
if [ $? -ne 0 ]; then
    echo "Failed to run the Docker container from $REPO"
    exit 1
fi

echo "Deployment successful"
