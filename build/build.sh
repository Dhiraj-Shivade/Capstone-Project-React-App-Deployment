#!/bin/bash

# #Login to DockerHub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

## Determine the branch name
if [ "$GIT_BRANCH" == "origin/dev" ]; then
    # Build the Docker image
    docker-compose build -t my-react-app .

    ## For dev branch
    docker tag my-react-app:latest $DOCKER_DEV_REPO:latest
    docker push $DOCKER_DEV_REPO:latest

elif [ "$GIT_BRANCH" == "origin/main" ]; then
    # Check if the latest commit on main includes a merge from dev
    if git log --format=%B --grep="Merge branch 'dev'"; then
        # Build the Docker image
        docker-compose build -t my-react-app .

        # For main branch (after merging dev into main)
        docker tag my-react-app:latest $DOCKER_PROD_REPO:latest
        docker push $DOCKER_PROD_REPO:latest
    fi
fi