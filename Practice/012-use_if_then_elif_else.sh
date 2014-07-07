#!/bin/bash
#Script if ... then ... elif ... then ... else statement in action

echo "Enter Number between 10 - 20 : \c"
read a

if [ $a -lt 10 ]
then
	echo "Number is not in range, i.e. less than 10."
elif [ $a -gt 20 ]
	echo "Number is out of range, i.e. greater then 20."
else
	echo "Number is in correct range, Good :-\)"
fi
