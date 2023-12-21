#!/bin/bash

# Initialize exposePort
exposePort=8001

# Loop through each directory in the current directory
for dir in */ ; do
    # Remove the trailing slash to get the directory name
    dir_name="${dir%/}"

    # Define the Dockerfile path
    dockerfile_path="${dir_name}/Dockerfile"

    # Write the content to the Dockerfile
    cat > "$dockerfile_path" <<EOF
FROM node:14

WORKDIR /app

RUN git clone -b ms-$dir_name https://github.com/djtoler/finalKube.git .

RUN npm install --force

EXPOSE $exposePort

CMD ["npm", "start"]
EOF

    # Increment the exposePort by 1 for the next Dockerfile
    ((exposePort++))
done
