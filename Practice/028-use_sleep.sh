#!/bin/bash
# Using 'sleep' as a interval

echo "Enter a Sentence: \c"
read sen

for word in $sen
	do
		echo $word
		sleep 5
	done
