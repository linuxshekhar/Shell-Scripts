#!/bin/bash
# while ... do ... done loop in Action

count=1

while [ $count -le 10 ]
	do
		echo $count
		count=`expr $count + 1`
	done
