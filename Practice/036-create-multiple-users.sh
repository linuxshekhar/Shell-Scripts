#!/bin/bash
# A simple shell script to to check Symantec Antivirus Details
# command line. Tested on RHEL 6.x, RHEL 5.x
# ----------------------------------------------------------------------
# Before run : please make one file containing Usernames as userlist.txt 
# ----------------------------------------------------------------------

for i in `cat userlist.txt `
do
echo $i
adduser $i
echo $i"123" | passwd --stdin "$i"
echo; echo "User $i password changed!"
done
