#!/bin/bash

# Function to extract routes and create files named after the route path
extract_routes() {
    local nodejs_file="$1"

    # Find every line that contains 'router.'
    grep 'router\.' "$nodejs_file" | while read -r line; do
        # Extract the word inside "/"
        route_path=$(echo "$line" | grep -oP '/\K[^"]+')
        # Replace slashes with underscores for the filename
        filename=$(echo "$route_path" | sed 's/\//_/g').js
        # Create a file with the route path name
        echo "$line" > "$filename"
    done

    echo "Files created for each route."
}

# Check if a filename is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <nodejs_file>"
    exit 1
fi

# Call the function with the Node.js file
extract_routes "$1"
