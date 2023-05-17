#!/bin/bash
# update system and install python and dep
yum update -y
yum install python3 -y
yum install pip -y 
pip install flask 

#downloading source code for app
FOLDER="https://raw.githubusercontent.com/rsametk/CloudFormationCLI/main"
cd /home/ec2-user/
mkdir templates
wget $FOLDER/app.py
cd templates
wget $FOLDER/templates/index.html
wget $FOLDER/templates/result.html

# running the app
cd ..
python3 app.py