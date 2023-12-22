#!/bin/bash

# Loop through each directory in the current directory
for dir in */ ; do
    # Check if the directory is actually a directory
    if [ -d "$dir" ]; then
        # Navigate into the directory
        cd "$dir"

        # Remove all files ending with "service-deployment.yaml"
        rm -f *service-deployment.yaml

        # Go back to the parent directory
        cd ..
    fi
done
