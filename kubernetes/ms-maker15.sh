#!/bin/bash

# Loop through each subdirectory
for dir in microservices/*/ ; do
    # Remove trailing slash and path to get the directory name
    dir_name="${dir#microservices/}"
    dir_name="${dir_name%/}"

    # Checkout the corresponding branch
    git checkout "$dir_name"

    # Loop through all files in the directory and prepend '1' to each file
    for file in "$dir"* ; do
        if [ -f "$file" ]; then  # Check if it's a file
            echo "1" | cat - "$file" > temp && mv temp "$file"
        fi
    done

    # Add all changes within the directory
    git add -A

    # Commit the changes
    git commit -m "Modified files in $dir_name"

    # Push to the corresponding remote branch
    git push origin "$dir_name"

    # Return to the initial branch
    git checkout -
done
