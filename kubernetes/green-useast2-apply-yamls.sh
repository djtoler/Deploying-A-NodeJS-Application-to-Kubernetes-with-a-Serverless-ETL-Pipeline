#!/bin/bash

# YAML_LOCATION_PREFIX="https://github.com/djtoler/finalKube/blob/green-useast2/kubernetes/"
GREEN_DEPLOYMENT = "green-useast2-"

# curl -O "${YAML_LOCATION_PREFIX}${GREEN_DEPLOYMENT}be-service.yaml"
# curl -O "${YAML_LOCATION_PREFIX}${GREEN_DEPLOYMENT}fe-service.yaml"
# curl -O "${YAML_LOCATION_PREFIX}${GREEN_DEPLOYMENT}be-deployment.yaml" 
# curl -O "${YAML_LOCATION_PREFIX}${GREEN_DEPLOYMENT}fe-deployment.yaml" 

kubectl apply -f ${GREEN_DEPLOYMENT}be-service.yaml
kubectl apply -f ${GREEN_DEPLOYMENT}fe-service.yaml
kubectl apply -f ${GREEN_DEPLOYMENT}be-deployment.yaml 
kubectl apply -f ${GREEN_DEPLOYMENT}fe-deployment.yaml 