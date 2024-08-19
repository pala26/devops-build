#!/bin/bash

# Check which branch is being built
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    chmod +x build.sh
    ./build.sh

    # Log in to Docker Hub
    docker login -u pala29 -p $DOCKER_PASSWORD

    # Tag the Docker image for the dev environment
    docker tag reactapp pala29/dev

    # Push the Docker image to the dev repository
    docker push pala29/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    chmod +x build.sh
    ./build.sh

    # Log in to Docker Hub
    docker login -u pala29 -p $DOCKER_PASSWORD

    # Tag the Docker image for the prod environment
    docker tag reactapp pala29/prod

    # Push the Docker image to the prod repository
    docker push pala29/prod
else 
    echo "Branch-not recognized. No build or push will occur."
    exit 1
fi

