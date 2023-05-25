#!/bin/bash

Dir="static-web"
Bucket=$1

ls $Dir | xargs -I {} aws s3 cp ./$Dir/{} s3://$Bucket/{}