#!/bin/bash

# Loop through each subdirectory in the current directory
for dir in */ ; do
    # Remove trailing slash to get the directory name
    dir_name="${dir%/}"

    # Enter the directory
    cd "$dir_name"

    # Checkout the branch that matches the directory name
    # Note: This assumes the branch already exists. If not, you might need to handle branch creation.
    git checkout "$dir_name"

    # Create a test.txt file
    echo "This is a test file for $dir_name" > test5.txt

    # Add the file to git
    git add test5.txt
    git add .

    # Commit the change
    git commit -m "Add test.txt to $dir_name"

    # Push to the corresponding remote branch
    git push --force origin "$dir_name"

    # Go back to the parent directory
    cd /home/ubuntu/final-project/v2/g_useast2_finalKube/finalKube/kubernetes/microservices

    echo "Processed $dir_name"
done
