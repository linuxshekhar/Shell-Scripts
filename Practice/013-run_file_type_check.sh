#!/bin/bash
#Script to check file type

echo "Enter a name exist in current directory: "
read name

if [ -f $name ] ; then
	echo "Given Name Type is: File."
elif [ -d $name ] ; then
	echo "Given Name Type is: Directory."
elif [ -L $name ] ; then
	echo "Given Name Type is: Link."
elif [ -c $name ] ; then
	echo "Given Name Type is: Character File."
elif [ -r $name ] ; then
	echo "Given Name has permission: read."
elif [ -w $name ] ; then
	echo "Given Name has permission: write."
elif [ -x $name ] ; then
	echo "Given Name has permission: execute."
elif [ -s $name ] ; then
	echo "Given Name has size: read."
fi
