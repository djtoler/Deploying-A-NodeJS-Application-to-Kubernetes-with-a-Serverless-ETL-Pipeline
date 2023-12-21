#!/bin/bash

aws configure set region us-east-2
cd /home/ubuntu/final-project/v2/g_useast2_finalKube/finalKube/kubernetes

kubectl delete -f green-useast2-fe-deployment.yaml
kubectl config use-context DT_FP@greencluster16.us-east-2.eksctl.io 

sleep 15s

kubectl apply -f green-useast2-fe-deployment.yaml

#To be done later
# kubectl apply -f redis-deployment.yaml 

# aws configure set region us-east-1

