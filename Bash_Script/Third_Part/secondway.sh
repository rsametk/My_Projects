#!/bin/bash

# Make sure the root user is executing this script file
if [[ "${UID}" -ne 0 ]]
then
        echo "Please log in as the root user"
        exit 1
fi

TIMESTAMP=`date +"%Y_%m_%d_%H_%M"`
source="/home/ec2-user/data /etc /boot /usr"
destination="/mnt/backup"
filename="${HOSTNAME}_$TIMESTAMP.tgz"

echo "Backing up..."

# Archiving the files/folders
tar -cvzf $destination/$filename $source

# Success message
if [[ "${?}" -eq 0 ]]
then
        echo "Backup is ready"
fi