#!/bin/bash
#Script for Arithmetic Operation for fractional numbers with expr & bc

echo "Please enter 1st float number: "
read a

echo "Please enter 2nd float number: "
read b

echo "$a + $b" | bc -l

echo "$a - $b" | bc -l

echo "$a * $b" | bc -l

echo "$a / $b" | bc -l

echo "$a % $b" | bc -l

#echo $c $d $e 
