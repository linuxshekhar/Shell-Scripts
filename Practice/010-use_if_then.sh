#!/bin/bash
#Script if ... then statement in action

echo "Enter Source and Target File names: "
read source target

if mv $source $target
then
	echo "Rename done successfully."
fi
