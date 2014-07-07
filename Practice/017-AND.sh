#!/bin/bash
#Script to use AND Logical Operation

echo "Enter a number between 50 - 100: \c"
read a

if [ $a -le 100 -a $a -ge 50 ]; then				#<--  -a = AND
	echo "You are within limits."
else
	echo "You are out of limits."
fi
