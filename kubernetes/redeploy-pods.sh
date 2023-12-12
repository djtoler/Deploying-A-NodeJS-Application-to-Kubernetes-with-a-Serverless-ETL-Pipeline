#!/bin/bash

cd /home/ubuntu/final-project/v2/g_useast2_finalKube/finalKube/kubernetes

kubectl delete -f green-useast2-fe-deployment.yaml

sleep 15s

kubectl apply -f green-useast2-fe-deployment.yaml

#To be done later
# kubectl apply -f redis-deployment.yaml 