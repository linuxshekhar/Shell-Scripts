#!/bin/bash
#Script for Arithmetic Operation with expr

echo "Please enter 1st number: "
read a

echo "Please enter 2nd number: "
read b

echo "Addition of given 2 number is: "
echo `expr $a + $b `

echo "Substraction of given 2 number is: "
echo `expr $a - $b `

echo "Multiplication of given 2 number is: "
echo `expr $a \* $b `

echo "Division of given 2 number is: "
echo `expr $a / $b `

echo "Reminder after Division of given 2 number is: "
echo `expr $a % $b `

# Operator Precedence

echo "Output of $a multiplied with sum of $a & $b and divide with $b" 
echo "$a * ($b + $a) / $b" | bc -l

