#!/bin/bash

# Define the name of the Docker container
container_name="secret-santa"

# Check if the Docker container exists
if docker ps -a --format '{{.Names}}' | grep -q "^$container_name$"; then
    # Stop the Docker container
    echo "Stopping Docker container $container_name..."
    docker stop $container_name

    # Remove the Docker container
    echo "Removing Docker container $container_name..."
    docker rm $container_name
else
    echo "Docker container $container_name does not exist."
fi
