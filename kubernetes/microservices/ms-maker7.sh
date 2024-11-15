#!/bin/bash

# Define the new package.json content
read -r -d '' new_package_json << 'EOF'
{
  "name": "server",
  "version": "1.0.0",
  "description": "A quiz network platform.",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "Yash Kumar Saini",
  "license": "ISC",
  "dependencies": {
    "body-parser": "^1.20.1",
    "connect-mongo": "^4.6.0",
    "cookie-parser": "^1.4.6",
    "cors": "^2.8.5",
    "dotenv": "^16.0.3",
    "express": "^4.18.2",
    "express-session": "^1.17.3",
    "mongoose": "^6.7.2",
    "mongoose-auto-increment": "^5.0.1",
    "redis": "^4.6.11"
  }
}
EOF

# Loop through each directory in the current directory
for dir in */ ; do
    # Check if the directory is actually a directory
    if [ -d "$dir" ]; then
        # Write the new package.json content into the package.json file
        echo "$new_package_json" > "${dir%/}/package.json"
    fi
done
