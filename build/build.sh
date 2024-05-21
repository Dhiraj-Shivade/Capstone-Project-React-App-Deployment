#!/bin/bash

# Navigate to the build directory
cd /var/lib/jenkins/workspace/capston-project/build

# Login to DockerHub
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

# Build the Docker image
docker build -t my-react-app:latest .

# Determine the branch name
if [ "$GIT_BRANCH" == "origin/dev" ]; then
    # Tag the Built Image
    docker tag my-react-app:latest $DOCKER_DEV_REPO:my-react-app:v1

    ## For dev branch
    docker push $DOCKER_DEV_REPO/my-react-app:v1

    # Check if the docker push was successful
    if [ $? -eq 0 ]; then
        echo "Successfully built and pushed the image to $DOCKER_DEV_REPO"
    else
        echo "Failed to push the image to $DOCKER_DEV_REPO"
        exit 1
    fi

elif [ "$GIT_BRANCH" == "origin/main" ]; then
    # Check if the latest commit on main includes a merge from dev
    if git log --format=%B --grep="Merge branch 'dev'"; then
        # Tag the Built Image
        docker tag my-react-app:latest $DOCKER_PROD_REPO:my-react-app:v1
        
        # For main branch (after merging dev into main)
        docker push $DOCKER_PROD_REPO/my-react-app:v1

        # Check if the docker push was successful
        if [ $? -eq 0 ]; then
            echo "Successfully built and pushed the image to $DOCKER_PROD_REPO"
        else
            echo "Failed to push the image to $DOCKER_PROD_REPO"
            exit 1
        fi
    else
        echo "Merge from dev branch not found in the latest commit on main. Skipping Docker image push to $DOCKER_PROD_REPO"
    fi
fi

