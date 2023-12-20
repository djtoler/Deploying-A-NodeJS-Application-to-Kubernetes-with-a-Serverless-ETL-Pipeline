#!/bin/bash

# YAML_LOCATION_PREFIX="https://raw.githubusercontent.com/djtoler/finalKube/blue-useast1/kubernetes/"
BLUE_DEPLOYMENT="blue-useast1-"

# curl -O "${YAML_LOCATION_PREFIX}${BLUE_DEPLOYMENT}be-service.yaml"
# curl -O "${YAML_LOCATION_PREFIX}${BLUE_DEPLOYMENT}fe-service.yaml"
# curl -O "${YAML_LOCATION_PREFIX}${BLUE_DEPLOYMENT}be-deployment.yaml" 
# curl -O "${YAML_LOCATION_PREFIX}${BLUE_DEPLOYMENT}fe-deployment.yaml" 

# Apply the Kubernetes configuration files.
# Assuming the script is executed in the same directory where files are downloaded.

kubectl apply -f "${BLUE_DEPLOYMENT}be-service.yaml"
kubectl apply -f "${BLUE_DEPLOYMENT}fe-service.yaml"
kubectl apply -f "${BLUE_DEPLOYMENT}be-deployment.yaml" 
kubectl apply -f "${BLUE_DEPLOYMENT}fe-deployment.yaml"
