#!/bin/bash

# Get the name of the current branch to use as the base for new branches
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Loop through each microservice directory inside the microservices directory
for dir in */ ; do
    # Remove the 'microservices/' prefix and trailing slash to get the directory name
    dir_name="${dir#microservices/}"
    dir_name="${dir_name%/}"

    # Checkout the current branch to start clean for each microservice branch creation
    git checkout "$current_branch"

    # Create a new orphan branch with the name of the directory
    git checkout --orphan "$dir_name"

    # Remove all files from the staging area to start fresh
    git rm -rf .

    # Add the microservice files to the staging area
    git add "$dir"

    # Move the microservice files to the root of the working directory
    git mv "$dir"* .

    # Commit the changes
    git commit -m "Initial commit for $dir_name microservice"

    # Push the new branch to the remote repository
    git push -u origin "$dir_name"

    # Return to the original branch before starting the next iteration
    git checkout "$current_branch"
done
