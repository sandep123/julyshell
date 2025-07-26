#!/bin/bash

# the scriot will report the  AWS resources  usages

#AWS s3
#AWS lamda
#AWS IAM users
#set - x
#set - p

#seit - o

if [ $# -ne 2 ]; then
	echo "usage: $0 <region> <service name> not correct"
	exit 1

fi


if ! command -v aws &> /dev/null; then 

	echo "aws cli is not install. please install it"
	exit 1
fi


if [ ! -d ~/.aws ]; then
	echo "CLI is not configure. plase conngigure it and try again"
	exit 1
fi

case $2 in
	EC2)
		aws ec2 describe-instances --region $1
		;;
	S3)
		aws s3 ls --region $1
		;;

	RDS)
		aws rds desrcibe-db-instance --region $1
	       	;;

	DynamoDB)
		aws dynamodb list-tables --region $1
		;;
	Lambda)
		aws lambda list-function --region $1
		;;
	EBS)
		aws describe-volumes --region $1
		;;
	ELB)
		aws describe-load-balancers --region $1
		;;

	VPC)
		aws describe-vpcs --region $1
		;;
	iam)
		aws iam get-user --user-name your-user-name  --region $1
		;;

esac
