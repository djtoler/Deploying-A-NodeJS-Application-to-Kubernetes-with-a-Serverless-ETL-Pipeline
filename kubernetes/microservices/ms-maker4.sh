#!/bin/bash

# Path to the original route.js file
ROUTE_FILE="../../routes/route.js"

# Check if the route.js file exists
if [ ! -f "$ROUTE_FILE" ]; then
    echo "The route.js file does not exist in the specified directory."
    exit 1
fi

# Initialize route_name
route_name=""

# Read the route.js file line by line
while IFS= read -r line || [ -n "$line" ]; do
    # Check if the line contains the start of a route definition
    if [[ $line == router.* ]]; then
        # Extract the route name using a regex
        route_name=$(echo $line | grep -oP '/\K[^"/]+')
        echo $route_name
    fi

    # Write the route to a file named after the route if within a route block
    if [[ -n $route_name ]]; then
        # Append the line to the file
        echo "$line" >> "${route_name}.js"
    fi

    # Check if the line contains the end of a route definition
    if [[ $line == '});' && -n $route_name ]]; then
        # Reset the route_name to prepare for the next route block
        route_name=""
    fi
done < "$ROUTE_FILE"
