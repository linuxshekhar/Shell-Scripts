#!/bin/bash
#Script of getting input from user and positional parameter
#configure for rename file/directory

# use as sh 004.rename2.sh <Old File Name> 

echo "Provide a new file name: "
read new_name

mv $1 $new_name
ls -l $new_name
