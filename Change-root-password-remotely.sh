#!/bin/bash
#
# A simple shell script to change root password remotely
#
# Tested on : Ubuntu 14.04 (Trusty)
#
# ----------------------------------------------------------------------------


for SERVER in <Ip Address> 
do
  ssh root@$SERVER 'echo "root:1234567" | chpasswd'
done
