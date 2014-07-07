#!/bin/bash
# FOR Loop in Action 

for item in *
do
	if [ -d $item ]; then
		echo $item
	fi
done
