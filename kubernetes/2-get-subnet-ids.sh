#!/bin/bash

aws ec2 describe-subnets \
    --filters "Name=tag:Name,Values=publicsubnet1,privatesubnet1,publicsubnet2,privatesubnet2" \
    --query "Subnets[*].[SubnetId, VpcId, Tags[?Key=='Name'].Value | [0]]" \
    --output text > blue-useast1-subnets.txt
