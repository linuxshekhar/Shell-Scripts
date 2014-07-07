#!/bin/bash
# 'case' Statement in Action

echo "Enter a character: \c"
read a

case $a in

	[a-z])												#<-- option of case
			echo "You entered a lower-case alphabet. "
		;;												#<-- indicate end of case

	[A-Z])
			echo "You entered a UPPER-CASE alphabet."
		;;

	[0-9])
			echo "You entered digit."
		;;

	?)
			echo "You entered Special Symbol"
		;;

	*)
			echo "You have entered more than one characters..."
		;;

esac
