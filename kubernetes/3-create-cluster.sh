#!/bin/bash

aws configure set region us-east-2

# Inputs for Kubernetes commands
#######################################################################################################################
CLUSTER_NAME="$1"
NODE_GROUP_FE_NAME="$2"
NODE_GROUP_FE_COUNT="$3"
NODE_GROUP_FE_TYPE="$4"
NODE_GROUP_BE_NAME="$5"
NODE_GROUP_BE_COUNT="$6"
NODE_GROUP_BE_TYPE="$7"
PRIVATE_SUBNET1="$8"
PRIVATE_SUBNET2="${9}"
PUBLIC_SUBNET1="${10}"
PUBLIC_SUBNET2="${11}"

# Create Kubernetes cluster in at least 2 private & 2 public subnets
# Create Node Groups for frontend/backend and associate IAM with OIDC for Kubernetes to use AWS services
#########################################################################################################################
eksctl create cluster "$CLUSTER_NAME" --vpc-private-subnets="$PRIVATE_SUBNET1,$PRIVATE_SUBNET2" --vpc-public-subnets="$PUBLIC_SUBNET1,$PUBLIC_SUBNET2" --without-nodegroup
eksctl create nodegroup --cluster "$CLUSTER_NAME" --name "$NODE_GROUP_FE_NAME" --node-type "$NODE_GROUP_FE_TYPE" --nodes "$NODE_GROUP_FE_COUNT"
eksctl create nodegroup --cluster "$CLUSTER_NAME" --name "$NODE_GROUP_BE_NAME" --node-type "$NODE_GROUP_BE_TYPE" --nodes "$NODE_GROUP_BE_COUNT" --node-private-networking --subnet-ids "$PRIVATE_SUBNET1,$PRIVATE_SUBNET2" --node-labels "role=backend"
eksctl utils associate-iam-oidc-provider --cluster "$CLUSTER_NAME" --approve

# Apply deployment files for making pods & service files for routing to pods
##########################################################################################################################
./green-useast2-apply-yamls.sh

# Download & create IAM policy for EKS Loadbalancer if it doesn't already exist
##########################################################################################################################
wget https://raw.githubusercontent.com/kura-labs-org/Template/main/iam_policy.json
# aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam_policy.json

echo "start creating service acct"

# Create service account & certificate manager
##########################################################################################################################
eksctl create iamserviceaccount --cluster="$CLUSTER_NAME" --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=arn:aws:iam::876764840442:policy/AWSLoadBalancerControllerIAMPolicy --override-existing-serviceaccounts --approve 

echo "start applying cert manager "

kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml

# Download configurations for the ingress controller & load balancer controller & give resources time to create
##########################################################################################################################
# wget https://raw.githubusercontent.com/kura-labs-org/Template/main/v2_4_7_full.yaml
sleep 10s
kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller/crds"
sleep 10s
kubectl apply -f v2_4_7_full.yaml 
sleep 10s

# Apply ingress-class, ingress & give resources time to create
##########################################################################################################################
kubectl apply -f green-useast2-ingress_class.yaml
sleep 20s
kubectl apply -f green-useast2-ingress.yaml

aws configure set region us-east-1