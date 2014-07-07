#!/bin/bash
#Script to count numbers of character from input

echo "Enter a Character: "
read a

if [ `echo $a | wc -c` -eq = 2 ]; then				#<-- We are using 2 instead of 1, cause it has a carriage return (\n) as a new line
	echo "You entered a character."
else
	echo "Invalid Oputput"
fi
