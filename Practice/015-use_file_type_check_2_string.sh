#!/bin/bash
#Script to use file type check with strings

echo "Enter a string1: \c"
read str1

echo "Enter a string2: \c"
read str2

str3=		#null variable

[ "$str1" = "$str2" ]		#<-- Note : " " -> indicate that this will act as string
echo $?

[ "$str1" != "$str2" ]		
echo $?

[ -n "$str2" ]				#<-- Note : -n -> Length of string is not 0
echo $?

[ -z "$str3" ]				#<-- Note : -n -> Length of string is 0
echo $?
