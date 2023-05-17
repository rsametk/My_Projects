#!/bin/bash

# Make sure the root user is executing this script file
if [[ "${UID}" -ne 0 ]]
then
        echo "Please log in as the root user"
        exit 1
fi

username=$1
comment=$2
password=`openssl rand -base64 9`

# Create the account
useradd $username -c "$comment"

# Error message
if [[ "${?}" -ne 0 ]]
then
        echo "Username is already taken. Please try again! "
        exit 1
fi

# Set up password
echo $password | passwd --stdin $username

# Error message
if [[ "${?}" -ne 0 ]]
then
        echo "Something went wrong. Please check your arguments."
        exit 1
fi

# Set password expiration on first login
passwd -e $username

# Success message
echo "User successfully created"
echo
echo "Username: $username"
echo
echo "Password: $password"