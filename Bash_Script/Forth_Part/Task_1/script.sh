#!/bin/bash

ec2_private_ip=`grep PrivateIpAddress info.json | head -1 | cut -d'"' -f4`

sed -i "s/ec2-private_ip/$ec2_private_ip/g" terraform.tf