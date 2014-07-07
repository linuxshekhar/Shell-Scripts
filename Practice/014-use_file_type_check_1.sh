#!/bin/bash
#Script to use file type check

echo "Enter a filename: \c"
read fname

if [ -f $fname ]; then
	if [ -w $fname ]; then
		echo "Now please type matter to append, and press ctld+d to quit"
		cat >> $fname
	else
		echo "You don't have write permission to $fname"
	fi
fi
