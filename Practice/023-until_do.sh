#!/bin/bash
# until ... do ... done Loop in Action

count=1

until [ $count -ge 10 ]
	do
		echo $count
		count=`expr $count +1`
	done
