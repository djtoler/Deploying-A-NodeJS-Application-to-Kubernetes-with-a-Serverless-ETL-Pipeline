#!/bin/bash

# Loop through each directory in the current directory
for dir in */ ; do
    # Remove the trailing slash to get the directory name
    dir_name="${dir%/}"

    # Enter the directory
    cd "$dir_name"

    # Remove the route.js file if it exists
    rm -f "route.js"

    # Check if a file named after the directory exists, and rename it to route.js
    if [ -f "$dir_name.js" ]; then
        mv "$dir_name.js" "route.js"
    fi

    # Go back to the parent directory
    cd ..
done
