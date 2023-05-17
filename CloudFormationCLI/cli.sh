#!/bin/bash
# to execute the script 
# [ bash ]./cli.sh keyname imageid 

# create a security group

keyName=$1

ImageId=$2

instanceType="t2.micro"

groupName="flaskSecurityGroup"

aws ec2 delete-security-group --group-name $groupName 2> /dev/null #if is there any

aws ec2 create-security-group --group-name $groupName --description "Allow port 80"

# create security group rules

aws ec2 authorize-security-group-ingress --group-name $groupName --port 80 --protocol tcp --cidr "0.0.0.0/0"

aws ec2 authorize-security-group-ingress --group-name $groupName --port 22 --protocol tcp --cidr "0.0.0.0/0"

# create ec2 instance 

webserver=$(aws ec2 run-instances --image-id $ImageId  --instance-type $instanceType --key-name $keyName --security-groups $groupName --user-data file://userdata.sh)


echo "Script Exec ...  Done"