#!/bin/bash

# Store the name of the current branch
current_branch="green-useast2"

# Fetch the latest state of your branches
git fetch origin

# Loop through each directory (microservice)
for dir in microservices/*/ ; do
    # Get the directory name without the path
    dir_name="${dir#microservices/}"
    dir_name="${dir_name%/}"

    # Check out the corresponding branch for the microservice
    git checkout "$dir_name"

    # Remove all content except the microservice directory
    # This command will keep the directory and delete everything else
    find . -mindepth 1 -not -regex "^./$dir_name\(/.*\)?$" -delete

    # Move the contents of the microservice directory to the root of the branch
    mv "$dir_name"/* .
    rmdir "$dir_name"  # Remove the now empty directory

    # Add changes to git
    git add .

    # Commit changes
    git commit -m "Restructure $dir_name contents"

    # Push changes to the corresponding remote branch
    git push origin "$dir_name"

    # Switch back to the original branch
    git checkout "$current_branch"
done
