#!/bin/bashe
# Grab user information from /etc/passwd file

echo "Enter Username: \c"
read uname

line=`grep $uname /etc/passwd`

IFS=:

set $line

echo "UserName: $1"
echo "UserID: $3"
echo "GroupId: $4"
echo "Comment Field: $5"
echo "Home Folder: $6"
echo "Default SHELL: $7"
