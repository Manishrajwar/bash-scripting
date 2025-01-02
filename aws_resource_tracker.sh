#!/bin/bash

# author: manish
# date: 31/12/2024
# version: v1
#
# this project is to track all the resource of the aws
#

# list all s3 
#
#

set -x
echo "print list of s3"
aws s3 ls

# list ec2 instances

echo "print list of ec2"
#to print onnly the instance id using jq (jq simplimy the json result)
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# list lambda


echo "orint list of lambda
"
aws lambda list-functions

# list iam 

echo "priint list of iam "
aws iam list-users
