#!/bin/bash
# Normal script before using break statement in Action

count=1

while [ $count -le 10 ]
	do
		echo $count
		count=`expr $count + 1`
	done

echo "We are out of LOOP."
