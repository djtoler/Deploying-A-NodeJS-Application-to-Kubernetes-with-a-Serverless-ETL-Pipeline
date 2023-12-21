#!/bin/bash

# Initialize containerPort
containerPort=8001

# Loop through each directory in the current directory
for dir in */ ; do
    # Remove the trailing slash to get the directory name
    dir_name="${dir%/}"

    # Define the YAML file name
    yaml_file="${dir_name}/${dir_name}-service.yaml"

    # Write the content to the YAML file
    cat > "$yaml_file" <<EOF
apiVersion: v1
kind: Service
metadata:
  name: ms-${dir_name}-service
spec:
  type: ClusterIP
  selector:
    app: ms-${dir_name}-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: $containerPort
EOF

    ((containerPort++))
done
