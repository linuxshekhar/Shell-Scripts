#!/bin/bash
#Script of Positional Parameters
#configure for rename file/directory

# use as sh 004.rename1.sh <Old File Name> <New File Name>

mv $1 $2

ls -l $2
