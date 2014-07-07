#!/bin/bash
# OR Logical Operator in Action

echo "Enter a Character: "
read a

if [ `echo $a | wc -c` -eq = 2 ]; then					#<-- we are using 2 instead of 1, cause it has a carriage return (\n) as a new line
	if [ $a = a -o $a = e -o $a = i -o $a = o -o $a =u ]		#<-- -o = OR
	then
		echo "You entered a vowel."
	else
		echo "Not a vowel"
	fi
else
	echo "Invalid Output"
fi
