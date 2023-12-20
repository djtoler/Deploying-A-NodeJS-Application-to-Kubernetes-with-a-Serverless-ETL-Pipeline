#!/bin/bash

cd /home/ubuntu/final-project/v2/b_useast1_finalKube/finalKube/kubernetes

aws configure set region us-east-1
kubectl config use-context DT_FP@bluecluster14.us-east-1.eksctl.io

kubectl delete -f blue-useast1-fe-deployment.yaml

sleep 15s

kubectl apply -f blue-useast1-fe-deployment.yaml 


#To be used later
# kubectl apply -f blue-useast1-redis-deployment.yaml 