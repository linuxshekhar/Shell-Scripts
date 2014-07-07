#!/bin/bash
# 'case' Statement in Action 2

echo "Enter a word: \c"
read a

case $a in

	[aeiou]* | [AEIOU]*)											#<-- | = OR
			echo "A word begins with vowel."
		;;												#<-- indicate end of case

	[0-9]*)
			echo "A word begins with digit."
		;;

	*[0-9])
			echo "Word ends with digit."
		;;

	???)
			echo "You entered 3 letters word."
		;;

	*)
			echo "You have entered more than one characters..."
		;;

esac
