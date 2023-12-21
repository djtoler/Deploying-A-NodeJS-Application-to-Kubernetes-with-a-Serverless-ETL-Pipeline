#!/bin/bash

# Loop through each subdirectory
for dir in */ ; do
    # Remove trailing slash to get the directory name
    dir_name="${dir%/}"

    # Checkout the corresponding branch
    git checkout "$dir_name"

    # Loop through all files in the directory and prepend '1' to each file
    for file in "$dir_name"/* ; do
        if [ -f "$file" ]; then  # Check if it's a file
            echo "1" | cat - "$file" > temp && mv temp "$file"
        fi
    done

    # Add all changes within the directory
    git add "$dir_name/"

    # Commit the changes
    git commit -m "Modified files in $dir_name"

    # Push to the corresponding remote branch
    git push origin "$dir_name"
done