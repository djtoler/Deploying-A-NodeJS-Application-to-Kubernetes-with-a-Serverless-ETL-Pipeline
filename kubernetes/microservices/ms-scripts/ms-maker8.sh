#!/bin/bash

# Initialize containerPort
containerPort=8001

# Loop through each directory in the current directory
for dir in */ ; do
    # Remove the trailing slash to get the directory name
    dir_name="${dir%/}"

    # Define the file name
    yaml_file="${dir_name}/${dir_name}-deployment.yaml"

    # Write the content to the YAML file
    cat > "$yaml_file" <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ms-${dir_name}
spec:
  replicas: 2
  selector:
    matchLabels:
      app: ms-${dir_name}-app
  template:
    metadata:
      labels:
        app: ms-${dir_name}-app
      containers:
      - name: ms-${dir_name}-app
        image: djtoler/qz-ms-${dir_name}:latest
        ports:
        - containerPort: $containerPort
EOF

    ((containerPort++))
done
