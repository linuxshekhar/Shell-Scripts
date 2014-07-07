#!/bin/bash
# continue statement in Action

count=0

while [ $count -le 9 ]
	do
		count=`expr $count + 1`
		if [ $count -eq 5 ]; then
			continue
		fi

		echo $count
	done
echo "We are out of LOOP."
