#!/bin/bash

# Loop through all .js files in the current directory
for file in *.js; do
    # Skip if it's a directory
    if [ -d "$file" ]; then
        continue
    fi

    # Extract the base name of the file
    base_name=$(basename "$file" .js)

    # Make a directory with the base name
    mkdir -p "$base_name"

    # Move the file into the new directory
    mv "$file" "$base_name"

    # Create route.js, index.js, and package.json in the new directory
    touch "$base_name/route.js"
    touch "$base_name/index.js"
    echo "{}" > "$base_name/package.json"  # Create an empty JSON object in package.json
done
