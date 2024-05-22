#!/bin/bash

# Determine the repo to pull the image from
if [ "$DOCKER_REPO" == "dev" ]; then

# Pull the image from the respective repository
docker pull $DOCKER_DEV_REPO:my-react-app-v1

# Check if the image pull was successful.
if [ $? -ne 0 ]; then
    echo "Failed to pull the Docker image from $DOCKER_REPO"
    exit 1
fi

# Run the container
docker run -d -p 80:80 $DOCKER_DEV_REPO:my-react-app-v1


# Check if the container run was successful
if [ $? -ne 0 ]; then
    echo "Failed to run the Docker container from $DOCKER_REPO"
    exit 1
fi

echo "Deployment successful"

elif [ "$DOCKER_REPO" == "prod" ]; then 

# Pull the image from the respective repository
docker pull $DOCKER_PROD_REPO:my-react-app-v1

# Check if the image pull was successful.
if [ $? -ne 0 ]; then
    echo "Failed to pull the Docker image from $DOCKER_REPO"
    exit 1
fi

# Run the container
docker run -d -p 80:80 $DOCKER_PROD_REPO:my-react-app-v1


# Check if the container run was successful
if [ $? -ne 0 ]; then
    echo "Failed to run the Docker container from $DOCKER_REPO"
    exit 1
fi

echo "Deployment successful"
fi

