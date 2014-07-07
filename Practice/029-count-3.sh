#!/bin/bash
# Count number of words and sentences in text wile without 'wc'

echo "Enter a Filename: \c"
read fname

terminal=`tty`

exec < $fname

nol=0
now=0

while read line
	do
		nol=`expr $nol + 1`
		set $line
		now=`expr $now + $#`
	done

echo "Number of words: $now"
echo "Number of lines: $nol"

exec < $terminal
